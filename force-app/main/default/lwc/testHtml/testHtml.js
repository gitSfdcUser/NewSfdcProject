import { LightningElement } from 'lwc';
export default class MyComponentName extends LightningElement {
    richtext = '<h2>Default <s>Value</s></h2>';
    sanitizedData;

    handleChange(e) {
        this.richtext = e.detail.value;
        const inputData = e.detail.value;
        const regex = /(<([^>]+)>)/gi;
        this.sanitizedData = inputData.replace(regex, '');
    }
}