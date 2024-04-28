import { LightningElement, api } from 'lwc';

export default class AccountEditForm extends LightningElement {
    @api recordId;
    industryClass = '';

    handleTypeChange(event) {
        const value = event.target.value;
        this.industryClass = value === 'Prospect' ? 'slds-hide' : '';
    }

    handleSubmit(event) {
        event.preventDefault();
        this.template.querySelector('lightning-record-edit-form').submit();
    }
}