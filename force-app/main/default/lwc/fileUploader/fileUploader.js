import { LightningElement } from 'lwc';

export default class FileUploader extends LightningElement {

    handleUploadFinished(event) {
        const file = event.detail.files[0];
        const fileName = file.name;
        const contentType = file.type;

        // Read the file content
        const reader = new FileReader();
        reader.onload = (e) => {
            const fileContent = window.btoa(e.target.result);
            
            // Submit the case and file upload
            fetch('/services/apexrest/submitcaseandfile', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    caseSubject: 'My Case Subject',
                    caseDescription: 'My Case Description',
                    fileName: fileName,
                    fileContent: fileContent,
                    fileContentType: contentType
                })
            })
            .then(response => response.json())
            .then(caseId => {
                console.log('Case submitted with Id: ' + caseId);
                // Display success message to user
            })
            .catch(error => {
                console.error('Error submitting case and file: ' + error.message);
                // Display error message to user
            });
        };
        reader.readAsBinaryString(file);
    }

}