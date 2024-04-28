import { LightningElement } from 'lwc';

export default class ChildDemo extends LightningElement {
    HandleSubstract(){
this.dispatchEvent(new CustomEvent('substract'));
    }
    HandleAdditiion(){
        this.dispatchEvent(new CustomEvent('add'));
    }
    HandleMultiply(event){
const VAlueForMultiply = event.target.value;
// alert('VAlueForMultiply:'+VAlueForMultiply);
this.dispatchEvent(new CustomEvent('multiply' ,
{detail: VAlueForMultiply} ))
    }

}