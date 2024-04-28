import { LightningElement, track } from 'lwc';

export default class MultiPicklistSearchable extends LightningElement {
    @track options = [
        // Add your list of options here
        // Each option should have a 'label' and 'value' property
        { label: 'Option 1', value: 'Option1' },
        { label: 'Option 2', value: 'Option2' },
        { label: 'Option 3', value: 'Option3' },
        { label: 'Option 4', value: 'Option4' }
    ];

    @track selectedValues = [];

    handleSelection(event) {
        this.selectedValues = event.detail.value;
    }
}