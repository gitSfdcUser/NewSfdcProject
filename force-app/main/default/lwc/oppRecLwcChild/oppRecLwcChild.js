import { LightningElement ,track} from 'lwc';
import TopFiveoppMethod from '@salesforce/apex/TopFiveopp.TopFiveoppMethod'
const columns= [
{label:'Opportunity record Id',fieldName:'Id'},
{label:'Opportunity NAme',fieldName:'Name'}
]


export default class OppRecLwcChild extends LightningElement {
    @track columns = columns;
    @track data = [];
connectedCallback(){
    TopFiveoppMethod()
    .then(result =>{
this.data = result;
    })
    .catch(error=>{
        console.log("error occured");
    })
}

}