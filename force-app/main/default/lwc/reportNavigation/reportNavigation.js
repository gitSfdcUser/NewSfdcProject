import { LightningElement } from 'lwc';

export default class ReportCard extends LightningElement {
  connectedCallback() {
    this.handleResize(); // call the function on initial load
    window.addEventListener('resize', () => { // add event listener for resize
      this.handleResize();
    });
  }

  handleViewAllClick(event) {
    event.preventDefault();
    window.location.href = 'https://danocloud5-dev-ed.lightning.force.com/lightning/o/Dashboard/home?queryScope=mru';
  }

  handleResize() {
    const mediaElement = this.template.querySelector('.slds-media');
    if (mediaElement) {
      if (screen.width < 640) { // adjust the styles for smaller screens
        mediaElement.classList.remove('slds-media_center');
        mediaElement.classList.add('slds-media_vertical');

        const mediaFigureElement = this.template.querySelector('.slds-media__figure');
        if (mediaFigureElement) {
          mediaFigureElement.classList.remove('slds-media__figure_small');
        }

        const mediaBodyElement = this.template.querySelector('.slds-media__body');
        if (mediaBodyElement) {
          mediaBodyElement.classList.remove('slds-text-align_center');
        }
      } else {
        mediaElement.classList.add('slds-media_center');
        mediaElement.classList.remove('slds-media_vertical');

        const mediaFigureElement = this.template.querySelector('.slds-media__figure');
        if (mediaFigureElement) {
          mediaFigureElement.classList.add('slds-media__figure_small');
        }

        const mediaBodyElement = this.template.querySelector('.slds-media__body');
        if (mediaBodyElement) {
          mediaBodyElement.classList.add('slds-text-align_center');
        }
      }
    }
  }
}