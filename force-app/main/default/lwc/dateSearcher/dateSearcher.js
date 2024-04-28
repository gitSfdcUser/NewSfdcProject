import { LightningElement,track } from 'lwc';
import searchRoItem from '@salesforce/apex/lwcDateCmpCtrl.searchRoItem';
import { NavigationMixin } from 'lightning/navigation'; 
export default class LwcSearchDate extends NavigationMixin(LightningElement){
    @track firstName;
    @track lastName;
    @track oldDate; 
    @track oldDate2; 
    @track newDate; 
    @track newDate2;
    @track dateRecoreId;
    @track errorMsg;
    @track roDateList;
    @track recordId;
    
    handleChangeAction(event){
             

        if(event.target.name == 'oldDate'){
            this.oldDate = event.target.value;  
           
            window.console.log('oldDate ##' + this.oldDate);
        }

        if(event.target.name == 'oldDate2'){
            this.oldDate2 = event.target.value;  
            window.console.log('oldDate2 ##' + this.oldDate2);
        }

    }



    searchAction(){
        
        searchRoItem({dateStr1:this.oldDate,dateStr2:this.oldDate2})
        .then(result=>{
            
            this.dateRecoreId = result.Id;
            this.roDateList=result;
             //window.console.log('dateRecoreId##Vijay2 ' + this.dateRecoreId);       
             window.console.log('roDateList ' + JSON.stringify(this.roDateList));       
                })
        .catch(error =>{
           this.errorMsg=error.message;
           window.console.log(this.error);
        });
     }


     actionToPublishedNav(event) {
        this.recordId=event.target.name;
        window.console.log('logAAA ' + this.recordId + 'LogBBB ' + event.target.name);
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId,
                objectApiName: 'Account',
                actionName: 'view'
            },
        });
    }
}