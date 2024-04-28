import { LightningElement, track} from 'lwc';

export default class TrackDemo extends LightningElement {
@track fullName= { firstName:"", LastName:""}

handleChange(event){
const field=event.target.name;

if(field ==="firstName"){
this.fullName.firstName = event.target.value;
}
else if(field ==="LastName"){
this.fullName.LastName = event.target.value;



}
}
}