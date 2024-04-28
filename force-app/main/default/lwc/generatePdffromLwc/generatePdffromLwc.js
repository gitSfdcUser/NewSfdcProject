import { LightningElement, wire } from 'lwc';
import AccountController from '@salesforce/apex/MyNewLwcController.AccountController';
import { loadStyle, loadScript } from 'lightning/platformResourceLoader';

export default class generatePdffromLwc extends LightningElement {
    accounts = [];

    @wire(AccountController)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data;
        } else if (error) {
            console.log('Encountering error while fetching data');
        }
    }

    getAccountDetailUrl() {
        return `https://danocloud5-dev-ed.lightning.force.com/lightning/r/Account/0015g00001BZn6VAAT/view`;
    }

get currentTime() {
    const now = new Date();
    const hours = now.getHours();
    const minutes = now.getMinutes();
    const amOrPm = hours >= 12 ? 'PM' : 'AM';
    const formattedHours = hours % 12 === 0 ? 12 : hours % 12;
    const formattedTime = `${formattedHours}:${minutes < 10 ? '0' : ''}${minutes} ${amOrPm}`;
    return `Today at ${formattedTime}`;
}

    handleExpansion(){
        console.log('Testing Expansion Click')
    }
}