import { LightningElement, api, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getRecord } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';
const FIELDS=['Account.Id'];

export default class ShowToast extends LightningElement {
    @api recordId;
    account;
    lastModifiedDate;
    
    // @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    // wiredRecord({ error, data }) {
    //     if (error) {
    //        console.log('error occured');
    //     } else if (data) {
    //         this.account = data;
    //         let modifiedDate = this.account.lastModifiedDate;
    //         if(!this.lastModifiedDate) {
    //             this.lastModifiedDate = this.account.lastModifiedDate;
    //         }
    //         if (modifiedDate != this.lastModifiedDate) {
    //         //this.showNotification();
    //            // this.navigateToNewAccountPage();
    //         }
    //     }
    // }

    showNotification() {
        const evt = new ShowToastEvent({
            title: 'Success',
            message: 'Account Updated',
            variant: 'Error'
        });
        this.dispatchEvent(evt);
    }

//   navigateToNewAccountPage() {
//     const defaultValues = encodeDefaultFieldValues({
//       Name: 'JSON.stringify(this.data)',
//       Email: 'deFault@gmail.com',
//       Industry: 'Education'
//     });

//     console.log(defaultValues);

//     this[NavigationMixin.Navigate]({
//       type: 'standard__objectPage',
//       attributes: {
//         objectApiName: 'Account',
//         actionName: 'new'
//       },
//       state: {
//         defaultFieldValues: defaultValues
//       }
//     });
//   }






}