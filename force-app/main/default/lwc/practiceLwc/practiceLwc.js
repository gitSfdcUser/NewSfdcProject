import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class PracticeLwc extends LightningElement {
myTitle="salesforce Master";

connectedCallback(){
    let callmyFunction=this.myFunction(10, 2);
    window.alert("callmyFunction by arrow function>>"+callmyFunction);
}




myFunction = (dividend,divisor) => {
return(dividend/divisor);
}
}