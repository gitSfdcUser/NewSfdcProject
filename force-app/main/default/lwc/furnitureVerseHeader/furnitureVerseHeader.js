import { LightningElement, api } from 'lwc';
import FURNITURE_VERSE_LOGO from '@salesforce/resourceUrl/FurnitureVerseLogo';

export default class FurnitureVerseHeader extends LightningElement {
    @api furnitureVerseLogoUrl = FURNITURE_VERSE_LOGO
    displayServiceList = false;
    handleMouseHover(){
        console.log('mouseHovering started........')
        this.displayServiceList = true;
    }
        handleOnClick(){
        console.log('handleOnClicking started........')
    }

    handleMouseOut(){
        this.displayServiceList = false;
console.log('handle mouse out........')
}

}