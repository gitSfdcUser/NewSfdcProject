import { LightningElement, api, wire } from "lwc";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CloseActionScreenEvent } from 'lightning/actions';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import { getRecord } from 'lightning/uiRecordApi';
export default class SreenAction extends LightningElement {
   @api recordId;
   @api objectApiName;
   @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    account;
   fields = [NAME_FIELD];
  

   handleSuccess(e) {
    console.log('-0-0-0-0-0',fields)
        // Close the modal window and display a success toast
        this.dispatchEvent(new CloseActionScreenEvent());
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Record updated!',
                variant: 'success'
            })
        );
   }
   connectedCallback(){
    console.log(" this.dispatchEvent(new CloseActionScreenEvent());",this.recordId);
        
    setTimeout(() => {
        alert(this.recordId);
    }, 5);
   
   }
 



}