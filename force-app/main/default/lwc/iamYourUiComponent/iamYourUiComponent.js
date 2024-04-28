import { LightningElement } from 'lwc';
export default class IamYourUiComponent extends LightningElement {
    showPill = true;
    showPill1 =true;
    
 handleRemove(event) {
        event.preventDefault();
        this.showPill1 = !this.showPill1;
    }
    handleRemoveOnly(event) {
        event.preventDefault();
        this.showPill = !this.showPill;
    }

    handleClick(event) {
        // this won't run when you click the remove button
        alert('The pill was clicked!');
    }
}