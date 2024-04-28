import { LightningElement } from 'lwc';
import FURNITURE_VERSE_BACKGROUND from '@salesforce/resourceUrl/FurnitureVerseBackGround'
export default class FurnitureVerseBody extends LightningElement {
furnitureVerseBackgroundUrl = FURNITURE_VERSE_BACKGROUND


connectedCallback() {
console.log('furnitureVerseBackgroundUrl'+this.furnitureVerseBackgroundUrl)

}

    get getBackgroundImage(){
        return `background-image:url("${this.furnitureVerseBackgroundUrl}")`;
    }


}