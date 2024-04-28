import { LightningElement ,track} from 'lwc';
import getOppList from '@salesforce/apex/ImperativeDataController.getOppList'

const columns= [
{label:'Player record Id',fieldName:'Id'},
{label:'player NAme',fieldName:'Name'}
]


export default class ImperativeDemo extends LightningElement {
    @track columns = columns;
    @track data = [];
connectedCallback(){
    getOppList()
    .then(result =>{
this.data = result;
    })
    .catch(error=>{
        console.log("error occured");
    })
}

}