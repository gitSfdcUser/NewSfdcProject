import { LightningElement } from 'lwc';
import PDFLib from '@salesforce/resourceUrl/PDFLib';
import { loadScript } from 'lightning/platformResourceLoader';

export default class PrintTRF extends LightningElement {
    trfCount = 1;
    isLoading = false;
    enableForm = true;

    renderedCallback() {
        // Check if the PDFLib script is already loaded before attempting to load it again
        if (!window.PDFLib) {
            loadScript(this, PDFLib)
                .then(() => {
                    console.log("PDFLib script loaded successfully.");
                    // You can perform any further actions that depend on the script being loaded here
                })
                .catch(error => {
                    console.error("Error loading PDFLib script:", error);
                    // Handle error if the script fails to load
                });
        } else {
            console.log("PDFLib script is already loaded.");
            // Perform actions that depend on the script being loaded here
        }
    }
}