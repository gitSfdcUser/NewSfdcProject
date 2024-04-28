import { LightningElement, api,track,wire } from 'lwc';
import { getRecord } from "lightning/uiRecordApi";
import CASE_RECORDTYPE_FIELD from '@salesforce/schema/Case.RecordTypeId'
export default class AccountEditForm extends LightningElement {
    @api recordId;
    industryClass = '';
 @track caseRecordTypeId;
isRecordTypeA;
isRecordTypeB;
isRecordTypeC;
     // Use the getRecord wire adapter to fetch the Case record and its RecordTypeId field
    @wire(getRecord, { recordId: '$recordId', fields: [CASE_RECORDTYPE_FIELD] })
    wiredCase({ error, data }) {
        if (data) {
            // If the record is fetched successfully, extract the RecordTypeId value and log it to the console
            const record = data;
            this.caseRecordTypeId = record.fields.RecordTypeId.value;
            console.log('Case Record Type Id: ', this.caseRecordTypeId);
 this.handleRecordTypeChange();    
     } else if (error) {
            // If there is an error in fetching the record, log the error to the console
            console.error('Error fetching Case record: ', error);
        }
    }
 connectedCallback() {
     //code
     console.log('print when called>>>>')
 }

    handleTypeChange(event) {
        const value = event.target.value;
        this.industryClass = value === 'Prospect' ? 'slds-hide' : '';
    }

    handleSubmit(event) {
        event.preventDefault();
        this.template.querySelector('lightning-record-edit-form').submit();
    }
   

handleRecordTypeChange(event) {
            if (this.caseRecordTypeId.toString() == '0125g000000BtiXAAS') {
        this.isRecordTypeA = true;
        this.isRecordTypeB = false;
        this.isRecordTypeC = false;
        
    } else if (this.caseRecordTypeId.toString() == '0125g000000BticAAC') {
        this.isRecordTypeA = false;
        this.isRecordTypeB = true;
        this.isRecordTypeC = false;
        
    } else if (this.caseRecordTypeId.toString() == 'RecordTypeCId')  {
        this.isRecordTypeA = false;
        this.isRecordTypeB = false;
        this.isRecordTypeC = true;
    }
}


    
}