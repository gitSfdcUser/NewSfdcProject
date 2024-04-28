import { LightningElement } from 'lwc';

export default class ParentDemo extends LightningElement {
    countValue=0;

    handleDecrement(){
this.countValue--;
    }

    handleIncrement(){
        this.countValue++;

    }
    handleProduct(event){
    const MultiplyingNumber = event.detail;
    // alert('MultiplyingNumber:'+MultiplyingNumber);
    this.countValue *= MultiplyingNumber;
    }

}