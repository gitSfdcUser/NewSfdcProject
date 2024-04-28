import { LightningElement ,track,api} from 'lwc';
import getOppList from '@salesforce/apex/ImperativeDataController.getOppList'

const columns= [
{label:'Player record Id',fieldName:'Id'},
{label:'player NAme',fieldName:'Name'}
]


export default class WireDeSortableDatatablemo extends LightningElement {
    @track columns = columns;
    @track data = [];
@api searchKey='';
@api recordid;


connectedCallback(){
    getOppList()
    .then(result =>{
this.data = result;
    })
    .catch(error=>{
        console.log("error occured");
    })
}



HANDLECHANGED(event){
this.searchKey = event.target.value;
console.log("searchkey"+ this.searchKey)
// any datatype to string.
getOppList({searchKey : this.searchKey})
.then(result =>{
this.data= result;
})
.catch(error=>{
    console.log("error occured");
})
    }


}