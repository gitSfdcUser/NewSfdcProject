import { LightningElement ,track} from 'lwc';
import getAccounList from '@salesforce/apex/ComboBoxAccountRelatedController.getAccounList';
import getConList from '@salesforce/apex/ComboBoxAccountRelatedController.getConList';
import getOppList from '@salesforce/apex/ComboBoxAccountRelatedController.getOppList';
//Define columns 
const columns=[
{label: 'Contacts Name', fieldName:'Name'},
{label: 'Contacts Email', fieldName:'Email'},
]
const columns2=[
{label: 'opportunity Name', fieldName:'Name'},
{label: 'opportunity id', fieldName:'Id'},
]





export default class ComboBoxAccountRelated extends LightningElement {
@track value = '';
@track accOption=[];

@track cardVisible=false; //hide show functionality
@track cardVisible2=false; //hide show functionality


@track data=[];  // use for storing contact details 
@track columns = columns

@track data2 =[];  // use for storing Opportunity details 
@track columns2 = columns2





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
this.cardVisible = true;  //whenever a an acount selected card show for show contact datatable
this.cardVisible2 = true;  //whenever a an acount selected card show for show opportunity datatable

this.value = event.detail.value;
window.alert( JSON.stringify(this.value));


getConList({selectedAccountId :this.value })  //pass the accountId to get  selected  opporotunity record here 
.then(result=>{
    this.data =result;

}).catch(error =>{
    window.alert('error'+error)

})


getOppList({selectedAccountId :this.value })  //pass the accountId to get  selected record here 
.then(result=>{
    this.data2 = result;

}).catch(error =>{
    window.alert('error'+error)

})




}
}