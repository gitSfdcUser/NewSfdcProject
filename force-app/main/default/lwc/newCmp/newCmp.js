import { LightningElement, track } from 'lwc';

export default class CustomButton extends LightningElement {
  @track isModalOpen = false;

  handleButtonClick() {
    // Set the isModalOpen property to true to open the new component
    this.isModalOpen = true;
  }

  closeModal() {
    // Set the isModalOpen property to false to close the new component
    this.isModalOpen = false;
  }
}