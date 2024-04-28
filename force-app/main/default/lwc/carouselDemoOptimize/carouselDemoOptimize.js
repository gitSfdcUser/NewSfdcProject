import { LightningElement } from 'lwc';
import SalesforceMaster from '@salesforce/resourceUrl/SalesforceMaster';
import Mountain from '@salesforce/resourceUrl/Mountain';
export default class CarouselDemoOptimize extends LightningElement {
    players = [
        {
            id: "1",
            src: Mountain,
            header: "Hacker",
            description: "We are Unique.But we havent any social identity",
            href: "https://www.google.com/search?q=hackers+pic&rlz=1C1ONGR_enIN1003IN1003&oq=hackers+pic&aqs=chrome..69i57.4900j0j1&sourceid=chrome&ie=UTF-8#imgrc=Tu6jkwN_K5fElM"
        },
        {
            id: "2",
            src: SalesforceMaster  + '/pexels-photo-516541.jpeg',
            header: "Hacker",
            description: "We are Unique.But we havent any social identity",
            href: "https://www.google.com/search?q=hackers+pic&rlz=1C1ONGR_enIN1003IN1003&oq=hackers+pic&aqs=chrome..69i57.4900j0j1&sourceid=chrome&ie=UTF-8#imgrc=Tu6jkwN_K5fElM"
        },
        {
            id: "3",
            src: SalesforceMaster  + '/pexels-photo-516541.jpeg',
            header: "Hacker",
            description: "We are Unique.But we havent any social identity",
            href: "https://www.google.com/search?q=hackers+pic&rlz=1C1ONGR_enIN1003IN1003&oq=hackers+pic&aqs=chrome..69i57.4900j0j1&sourceid=chrome&ie=UTF-8#imgrc=Tu6jkwN_K5fElM"
        },

    ];

    // Expose the static resource URL for use in the template
    //trailheadLogoUrl = SalesforceMaster;

    // Expose URL of assets included inside an archive file
    //einsteinUrl = SalesforceMaster + '/MyStaticResource/pexels-photo-753626.JPEG';

}