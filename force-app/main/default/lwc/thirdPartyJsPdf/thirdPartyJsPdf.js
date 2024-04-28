// libsD3.js
/* global d3 */
import { LightningElement } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { loadScript, loadStyle } from "lightning/platformResourceLoader";
import jsPdf_New from "@salesforce/resourceUrl/jsPdf_New"; // Corrected variable name

export default class LibsD3 extends LightningElement {
  svgWidth = 400;
  svgHeight = 400;

  d3Initialized = false;

  renderedCallback() {
    if (this.d3Initialized) {
      return;
    }
    this.d3Initialized = true;

    Promise.all([loadScript(this, jsPdf_New + "/jspdf_New.umd.min.js")]) // Corrected variable name
      .then(() => {
        this.initializeD3();
      })
      .catch((error) => {
        console.error('Error loading D3:', error); // Log the error to console for debugging
        const errorMessage = error && error.message ? error.message : 'Unknown error'; // Check if error is defined before accessing its properties
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Error loading D3",
            message: errorMessage,
            variant: "error",
          }),
        );
      });
  }

  initializeD3() {
    console.log('initialized:::::')
  }
}