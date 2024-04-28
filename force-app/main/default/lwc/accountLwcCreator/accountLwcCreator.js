// JavaScript controller code
import { LightningElement, wire } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import getRelatedContacts from '@salesforce/apex/RelatedContactsController.getRelatedContacts';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import ACCOUNTID_FIELD from '@salesforce/schema/Contact.AccountId';
import OWNER_FIELD from '@salesforce/schema/Contact.OwnerId';

export default class RelatedContactsCard extends LightningElement {
    recordId = '0015g00001F6udjAAB'; // Account ID
    relatedContacts;

    columns = [
        { label: 'Row Number', fieldName: 'rowNumber', type: 'number', initialWidth: 100 },
        { label: 'Name', fieldName: NAME_FIELD.fieldApiName, type: 'text' },
        { label: 'Email', fieldName: EMAIL_FIELD.fieldApiName, type: 'email' },
        { label: 'AccountId', fieldName: ACCOUNTID_FIELD.fieldApiName },
        { label: 'OwnerId', fieldName: OWNER_FIELD.fieldApiName }
    ];

    @wire(getRelatedContacts, { accountId: '$recordId' })
    wiredRelatedContacts({ error, data }) {
        if (data) {
            // Add row numbers to the relatedContacts data
            this.relatedContacts = data.map((contact, index) => {
                return {
                    ...contact,
                    rowNumber: index + 1
                };
            });
        } else if (error) {
            // Handle error
        }
    }

    handleRefresh() {
        // Call the Apex method again to refresh the data
        return refreshApex(this.wiredRelatedContacts);
    }
}