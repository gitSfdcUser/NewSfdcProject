import { LightningElement, api, wire } from 'lwc';
import getOptionsMetadata from '@salesforce/apex/OptionsMetadataController.getOptionsMetadata';
import sendDocumentForDigitalSign from '@salesforce/apex/SignWellApi.sendDocumentForDigitalSign';

export default class SendDocumentForDigitalSign extends LightningElement {
    @api recordId;
    options = [];
    selectedOption;

    @wire(getOptionsMetadata)
    wiredOptions({ error, data }) {
        if (data) {
            this.options = data.map(option => ({
                label: option.label,
                value: option.value
            }));
        } else if (error) {
            console.error('Error retrieving options:', error);
        }
    }

    closeModal() {
        // Close the modal
        this.dispatchEvent(new CustomEvent('close'));
    }

    handleOptionChange(event) {
        this.selectedOption = event.target.value;
        // Handle the selected option value here
        console.log('Selected Option: ', this.selectedOption);
    }

    callSendDocumentForDigitalSign() {
    console.log(' called this method::::');   
        sendDocumentForDigitalSign({parameter: this.selectedOption })
            .then(result => {
                // Handle success response
                console.log('Success: ', result);


            })
            .catch(error => {
                // Handle error response
                console.log('Error: ', error);
            });
    }

    handleCancel() {
      //  window.location.replace("https://www.signwell.com/d/8984fb3470/");
        window.location.href = "https://www.signwell.com/d/8984fb3470/";

    }

    handleSend() {
        console.log('Send::::::', this.selectedOption);
        // call the method for sending documents as per template
    this.callSendDocumentForDigitalSign();
    }
}