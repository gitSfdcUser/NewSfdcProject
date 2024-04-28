import { LightningElement ,track} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import LOGINS_OBJECT from '@salesforce/schema/Login__c';
import USERNAME_FIELD from '@salesforce/schema/Login__c.Username__c';
import PASSWORD_FIELD from '@salesforce/schema/Login__c.Password__c';

export default class TakshilaLoginPage extends LightningElement {
    // objectApiName is "Account" when this component is placed on an account record page
    objectApiName = LOGINS_OBJECT;

fields = [USERNAME_FIELD, PASSWORD_FIELD];

handleSuccess(event) {
    const evt = new ShowToastEvent({
        title: 'Login Account created',
        message:'You are Signed  in successfully' +'Record ID: ' + event.detail.id,
        variant: 'success',
    });
    this.dispatchEvent(evt);
}
}