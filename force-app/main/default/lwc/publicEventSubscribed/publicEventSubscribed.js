import { LightningElement, api } from 'lwc';
import { subscribe, unsubscribe, onError, setDebugFlag, isEmpEnabled } from 'lightning/empApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class PublicEventSubscribed extends LightningElement {
    channelName = '/event/Dano__Notification_Event__e';
    isSubscribeDisabled = false;
    isUnsubscribeDisabled = !this.isSubscribeDisabled;
    subscription = {};
    @api accountName;
    connectionState = 'Closed';

    // Tracks changes to channelName text field
    handleChannelName(event) {
        this.channelName = event.target.value;
    }

    // Initializes the component
    connectedCallback() {
        // Register error listener
        this.registerErrorListener();
        // Handle initial subscription
        this.handleSubscribe();
        // Set up a periodic ping to keep the connection alive
        this.setupPing();
    }

    // Handles subscribe button click
    handleSubscribe() {
        // Invoke subscribe method of empApi. Pass reference to messageCallback
        subscribe(this.channelName, -1, this.messageCallback).then(response => {
            // Response contains the subscription information on subscribe call
            console.log('Subscription request sent to: ', JSON.stringify(response.channel));
            this.subscription = response;
            this.toggleSubscribeButton(true);
        }).catch(error => {
            console.error('Error subscribing to channel:', JSON.stringify(error));
            this.handleSubscribeError();
        });
    }

    // Handles unsubscribe button click
    handleUnsubscribe() {
        this.toggleSubscribeButton(false);

        // Invoke unsubscribe method of empApi
        unsubscribe(this.subscription, response => {
            console.log('unsubscribe() response: ', JSON.stringify(response));
            // Response is true for successful unsubscribe
        });
    }

    // Handles errors during subscription
    handleSubscribeError() {
        // Handle the error and retry subscription after a delay
        setTimeout(() => {
            this.handleSubscribe();
        }, 5000); // Retry after 5 seconds (adjust as needed)
    }

    // Register error listener
    registerErrorListener() {
        // Invoke onError empApi method
        onError(error => {
            console.log('Received error from server: ', JSON.stringify(error));
            // Error contains the server-side error
            this.handleSubscribeError();
        });
    }

    // Toggle subscription button states
    toggleSubscribeButton(enableSubscribe) {
        this.isSubscribeDisabled = enableSubscribe;
        this.isUnsubscribeDisabled = !enableSubscribe;
    }

    // Message callback function
    messageCallback = (response) => {
        console.log('New message received : ', JSON.stringify(response));
        this.accountName = response.data.payload.RecordChange__c;
        const toastEvent = new ShowToastEvent({
            title: 'Success!',
            message: 'Account ' + this.accountName + ' Created Successfully!!',
            variant: 'success'
        });
        this.dispatchEvent(toastEvent);
    }

    // Set up periodic ping to keep connection alive
    setupPing() {
        setInterval(() => {
            if (this.connectionState === 'Connected') {
                // Use any event name that you are not actively using in your application
                subscribe('/event/PingEvent__e', -1, () => {});
            }
        }, 60000); // Ping every 60 seconds (adjust as needed)
    }
}