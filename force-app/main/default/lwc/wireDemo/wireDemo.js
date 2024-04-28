import { LightningElement ,wire,track} from 'lwc';
import getAccounList from '@salesforce/apex/WireDemoController.getAccounList';

const columns=[
{label: 'Name',fieldName :"Name"},
{label: 'Id of Record',fieldName :'Id'},

];



export default class WireDemo extends LightningElement {


@track columns = columns;
@track data= [];

@wire(getAccounList)
wiredAccounts({data, error}){
if(data){
    this.data = data;
}
    else if(error){
   console.log('error occured')     
    
}
}
}