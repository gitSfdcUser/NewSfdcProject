import { LightningElement ,track } from 'lwc';

export default class IfConditionalDemo extends LightningElement {
@track onclickButtonLabel = 'show';
myTitle="Salesforce Master";
@track CardVisible=false;



handleClick(event){
const label = event.target.label;
if(label==='show'){
    this.onclickButtonLabel = 'Hide';
    this.CardVisible=true;
}
else if(label==='Hide'){
    this.onclickButtonLabel = 'show';
    this.CardVisible=false;
}

}


}