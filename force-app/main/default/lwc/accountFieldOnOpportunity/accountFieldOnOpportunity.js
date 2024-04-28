import { LightningElement, wire } from 'lwc';
import AccountController2 from '@salesforce/apex/MyNewLwcController.AccountController2';

export default class MyComponent extends LightningElement {
   //Method 2
     @wire (AccountController2) wiredAccounts({data,error}){
          if (data) {
          console.log('console>>>>',data); 
          } else if (error) {
          console.log(error);
          }
     }
}