import { LightningElement, track } from 'lwc';

export default class FurnitureVerseFooter extends LightningElement {
    @track currentYear = new Date().getFullYear();
}