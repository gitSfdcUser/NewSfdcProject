import { LightningElement,api } from 'lwc';

export default class ChildLwc extends LightningElement {

@api counter = 0;
@api maximizeCounter(){
    this.counter += 100;

}

}