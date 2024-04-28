import { LightningElement ,track} from 'lwc';
import getAllObjectList from '@salesforce/apex/objectComboBoxController.getAllObjectList';
import getPicklistTypeFields from '@salesforce/apex/objectComboBoxController.getPicklistTypeFields';
export default class ObjectComboBox extends LightningElement {
@track value = '';
@track objectList=[];
@track lstOfFields = [];
@track Fields = 'Fields';
objectName = '';   


// getting values of below function options
get options() {
return this.objectList;

}

get options2() {
return this.lstOfFields;
}

//connected call back funnction for automatic calling
connectedCallback() { 
getAllObjectList()
.then((result) => {
    if (result) {
        this.objectList = [];
        for (let key in result ) {
            this.objectList.push({ label: key, value: key });
        }
    } else {
        console.log('Error in getting objects ')
    }
}).catch((error) => {
    console.log('Catch Error in getting objects   ')
});
}

//on event change method..
onObjectChange(event) { 
this.objectName = event.detail.value;
this.Fields = '';
this.Fields = this.objectName + 'Fields';
this.handleGetAllFields();

}

// defining a function only
handleGetAllFields(){
getPicklistTypeFields({ strObjectName: this.objectName })
.then(result => {
    this.lstOfFields = [];
    for (let key in result) {
        this.lstOfFields.push({ label: key, value: key });
    }
})
.catch(error => {
    console.log('Error in getting  fields');
})
} 


}