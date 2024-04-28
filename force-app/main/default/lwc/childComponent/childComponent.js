import { LightningElement, api} from 'lwc';

export default class ChildComponent extends LightningElement {
    @api itemName="Salesforce MAster";

    @api handleChangeValue(){
        this.itemName="Salesforce Lwc Demo MAster";
      
 
    }



}