// imageFromContentDocument.js
import { LightningElement, wire } from 'lwc';
import { getFieldValue, getRecord } from 'lightning/uiRecordApi';
import IMAGE_URL_FIELD from 
    '@salesforce/schema/ContentDocument.LatestPublishedVersion.VersionDataUrl';

export default class ImageFromContentDocument extends LightningElement {

    @wire(getRecord, {recordId: '0695g00000Afs8QAAR', fields: [IMAGE_URL_FIELD] })
    contentDocImage;

    get imageUrl() {
        return getFieldValue(this.contentDocImage.data, IMAGE_URL_FIELD);
    }

    get resizedImageUrl() {
        console.log('OUTPUT : ',getFieldValue(this.contentDocImage.data, IMAGE_URL_FIELD) + 
            '?thumb=THUMB240BY180');
        return getFieldValue(this.contentDocImage.data, IMAGE_URL_FIELD) + 
            '?thumb=THUMB240BY180';
    }











}