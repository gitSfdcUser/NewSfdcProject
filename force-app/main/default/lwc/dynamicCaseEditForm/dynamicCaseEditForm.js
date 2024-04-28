import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import CASE_OBJECT from '@salesforce/schema/Case';
import RECORD_TYPE_FIELD from '@salesforce/schema/Case.RecordTypeId';

const FIELDS_BY_RECORD_TYPE = {
  '0125g000000BtiX': [
    { fieldName: 'Priority', editable: true },
    { fieldName: 'Subject', editable: true }
  ],
  '0125g000000Btic': [
    { fieldName: 'Priority', editable: true },
    { fieldName: 'Subject', editable: true }
  ]
};

export default class EditCaseForm extends LightningElement {
  @api recordId;
  caseObject = CASE_OBJECT;
  recordTypeId;

  @wire(getRecord, {
    recordId: '$recordId',
    fields: () => FIELDS_BY_RECORD_TYPE[this.recordTypeId] || []
  })
  case;

  get recordTypeId() {
    return getFieldValue(this.case.data, RECORD_TYPE_FIELD);
  }

  get fieldNames() {
    return FIELDS_BY_RECORD_TYPE[this.recordTypeId].map(field => field.fieldName);
  }

  handleSubmit(event) {
    event.preventDefault();
    const fields = event.detail.fields;
    this.template.querySelector('lightning-record-edit-form').submit(fields);
  }

  handleSuccess() {
    this.dispatchEvent(
      new CustomEvent('casesubmitted', {
        detail: { recordId: this.recordId }
      })
    );
  }
}