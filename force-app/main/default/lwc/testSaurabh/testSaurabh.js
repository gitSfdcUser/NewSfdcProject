import { LightningElement, track } from 'lwc';

export default class MultiSelectPicklist extends LightningElement {
  @track options = [
    { label: 'test 1', value: 'Option 1' },
    { label: 'Option 2', value: 'Option 2' },
    { label: 'Option 3', value: 'Option 3' },
    // Add more options as needed
  ];

  @track selectedOptions = [];
  @track filteredOptions = [];

  handleSearch(event) {
    const searchTerm = event.target.value.toLowerCase();
    this.filteredOptions = this.options.filter(option => option.label.toLowerCase().includes(searchTerm));
  }

  handleOptionClick(event) {
    const selectedValue = event.target.dataset.value;
    const selectedOption = this.options.find(option => option.value === selectedValue);
    if (!this.selectedOptions.includes(selectedOption)) {
      this.selectedOptions = [...this.selectedOptions, selectedOption];
    }
  }
}