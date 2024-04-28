import { LightningElement ,track} from 'lwc';
import getAccounList from '@salesforce/apex/ComboBoxDemoController.getAccounList';
import Name from '@salesforce/schema/Account.Name';
import Id from '@salesforce/schema/Account.Id';
export default class ComboBoxDemo extends LightningElement {
@track value = '';
@track accOption=[];


s

get options() {
    return this.accOption;
    
}

connectedCallback(){
getAccounList()
.then(result =>{
let arr=[];
for(var i=0;i<result.length;i++){
    arr.push({label: result[i].Name,value:result[i].Id})
}
this.accOption=arr;


})

}



handleChange(event) {
    this.value = event.detail.value;
}
}