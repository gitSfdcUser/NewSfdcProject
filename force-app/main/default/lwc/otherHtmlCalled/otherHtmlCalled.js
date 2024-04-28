import { myFunction, myVariable } from 'c/htmlFileOnly';

export default class OtherHtmlCalled extends LightningElement {
  connectedCallback() {
    // Use the imported function
    myFunction();

    // Access the imported variable
    console.log(myVariable);
  }
}