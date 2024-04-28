import { LightningElement,track } from 'lwc';

export default class ModalDemoInLWC extends LightningElement {
    @track isShowModal = true;

    hideModalBox() {  
        this.isShowModal = false;
        location.reload();

    }
}