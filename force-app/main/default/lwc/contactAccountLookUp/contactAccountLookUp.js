import { LightningElement } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import CONTACT_ACCOUNTID_FIELD from '@salesforce/schema/Contact.AccountId';

/**
 * Creates Account records.
 */
export default class ContactAccountLookUp extends LightningElement {
    ContactObject = CONTACT_OBJECT;
    nameField = NAME_FIELD;
    websiteField = PHONE_FIELD;
    accountIdField = CONTACT_ACCOUNTID_FIELD;

    handleAccountCreated(){
        window.alert('Contact with lookUp created');
        
    }
}