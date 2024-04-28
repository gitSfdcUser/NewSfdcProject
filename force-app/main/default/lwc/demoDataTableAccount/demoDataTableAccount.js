import { LightningElement, wire } from 'lwc';
import AccountController from '@salesforce/apex/MyNewLwcController.AccountController';
import MyjsPDF from '@salesforce/resourceUrl/MyjsPDF';
import { loadStyle, loadScript } from 'lightning/platformResourceLoader';

export default class DemoDataTableAccount extends LightningElement {
    accountList
    @wire(AccountController)
    accounts
@wire(AccountController)
accountHandler({data, error}){
    if(data){
        this.accountList = data.map(item=>{
            let newType = item.industry  ==null?'It is null value ':'it has some innvisible value'
            return {...item,newType}
        })
    }
    if(error){
console.error(error)
    }

}
}