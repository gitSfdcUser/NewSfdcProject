import { LightningElement } from 'lwc';
import { loadStyle } from 'lightning/platformResourceLoader';
import CUSTOM_CSS from '@salesforce/resourceUrl/CustomCssByMe';

export default class OverRidingSldsInSalesforce extends LightningElement {
    connectedCallback() {
                        console.log('connectedCallback called');

        try {
            loadStyle(this, CUSTOM_CSS, function successCallback() {
                console.log('Custom CSS loaded successfully.');
            }, function errorCallback(error) {
                console.log('Error loading Custom CSS:', error);
            });
        } catch (error) {
            console.log('An error occurred:', error);
        }
    }
}