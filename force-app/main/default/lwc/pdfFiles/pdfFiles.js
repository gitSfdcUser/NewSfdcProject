import { LightningElement, api, wire, track } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import getPdfFiles from '@salesforce/apex/PdfFilesController.getPdfFiles';

const columns = [
    { label: 'Name', fieldName: 'Url', type: 'url',sortable: true,  typeAttributes: { label: { fieldName: 'Name' } } },
    { label: 'Type', fieldName: 'FileType', type: 'text', sortable: true }

];

export default class PdfFiles extends LightningElement {
    @api recordId;
    @track pdfFiles = [];
    originalPdfFiles = [];
    columns = columns;
    sortedBy;
    sortedDirection;

    @wire(getRecord, { recordId: '$recordId', fields: ['Case.Subject'] })
    case;

    @wire(getPdfFiles, { caseId: '$recordId' })
    wiredPdfFiles({ error, data }) {
        if (data) {
            this.pdfFiles = data.map(file => ({
                Id: file.Id,
                Name: file.Title,
                FileType: file.FileType,
                Url: '/' + file.Id
            }));
            this.originalPdfFiles = this.pdfFiles; // Store original data
        } else if (error) {
            console.error('Error fetching PDF files:', error);
        }
    }

    handleSort(event) {
        this.sortedBy = event.detail.fieldName;
        this.sortedDirection = event.detail.sortDirection;
        this.sortData(this.sortedBy, this.sortedDirection);
    }

    sortData(fieldname, direction) {
        let parseData = JSON.parse(JSON.stringify(this.pdfFiles));
        // Return the updated data
        parseData = parseData.sort((a, b) => {
            let t1 = a[fieldname] == b[fieldname] ? 0 : a[fieldname] > b[fieldname] ? 1 : -1;
            return direction === 'asc' ? t1 : -t1;
        });
        this.pdfFiles = parseData;
    }

    handleSearch(event) {
        // Get the search string
        const searchString = event.detail.value.toLowerCase();
        // Filter the original data based on search string
        this.pdfFiles = this.originalPdfFiles.filter(row => {
            return Object.values(row).some(
                value => value.toLowerCase().includes(searchString)
            );
        });
    }
}