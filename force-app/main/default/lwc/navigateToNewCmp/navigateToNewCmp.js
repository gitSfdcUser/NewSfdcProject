import { LightningElement, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class CustomButton extends NavigationMixin(LightningElement) {
  @api recordId;

 navigateToAuraComponent() {
    this[NavigationMixin.Navigate]({
      type: 'standard__component',
      attributes: {
        componentName: 'c__CallFlowFromLightning',
      },
    });
  }
}