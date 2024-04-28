import { LightningElement } from 'lwc';

export default class CssCube extends LightningElement {
connectedCallback() {
        var Callabck = 'Zero to Hero Course';

                        console.log(window.Callabck);

    //code
}

handleClick_1(){
console.log('I am from practice js >>>>>>>.');
    console.log('I am from practice js >>>>>>>.',abc());
this.abc();

}

abc(){

var Hero = 'ueriogoiwrejfijwekm';
    console.log(Hero);


}
handleClick_2(){
// Var keyword Variable can be update and re declarable >>>>
// It can be scope and global variable 
//But is not code blockl variable 
var Course = 'Zero to Hero Course';
    console.log('I am from >>>js >>>>>>>.',Course);
var Course = 'I am reDeclared>>>.'
    console.log(Course)
            console.log(window.course);


}
handleClick_3(){
// let keyword Variable can be updated but not  re declarable >>>>
// It can be scope and  block variable 
//But is not support global variable 
let Course = 'Zero to Hero Course';
    console.log('I am from >>>js >>>>>>>.',Course);
    console.log(Course)
            console.log(window.course);





}




handleClick_4(){
// Connst keyword Variable cannot  be updated and caNNOT re declarable >>>>
    // It can be scope and  block variable 

var bigNum = 1023920n;
    console.log('I am from >>>js >>>>>>>.',typeof bigNum );

// undefined 
var Kiiii
    console.log('Kiiii >>>>>>>.',typeof Kiiii);
// object
var obj={}
    console.log('obj >>>>>>>.',typeof obj);
// array
var ar= []
    console.log('ar >>>>>>>.',typeof ar);
//Sysmbol
var sym =  Symbol('Id')
    console.log('sym >>>>>>>.',typeof sym);
//null
var x2 = 10
x2 = null
    console.log('x2 >>>>>>>.',typeof x2);


// String() Soolean()

console.log('String>>>>>', typeof new String('Hey'))
}


HandleMyLearn_12(){
    var arr;
    arr= ["a","b","c"];
        console.log('arrtest >>>>>>>.');

    console.log('arr >>>>>>>.',arr);
    
console.log(arr[0]);

console.log(arr[1]);
console.log(arr[3]);
arr.push('3')
console.log(arr);
//pbject

var Obj = {"name":"MyWorkingCodeJs","age":25,"Stringd Value":"keyPair23"}
console.log('OUTPUT : ',Obj.name);

console.log('array : ',Obj["Stringd Value"]);
Obj.NewLearn = "jfklweajfojaiejfkjweifjwe";
console.log('efnkwfoijws;iejf>>>>>>>>>>',Obj.NewLearn)

}


// Spread operatorss
HAndleClickLearn_13(){


    //Expanding Of string
    let greeting = "Hello Everyone";
    let charList =[...greeting]
    console.log('Lets See ,magic>>>>>',charList)
        console.log('Lets See ,magic>>>>>',charList[0])



//combining string value

    let newVar2 =["Hello EveryoneByme","NewOneapp"];
    let newvar = ["kwefkmew","fjwehjfjf"];
let NewVar3 = [...newvar, ...newVar2];
console.log('MyNewComboVarnll>>>>>');

console.log('MyNewComboVar>>>>>',NewVar3);

//adding values

let arr5v=["ab","b","c","d"]
let arr6v = [arr5v,...arr5v,"ismyowekwoeodkeok"]
console.log('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>',arr6v)



//Combininng Objects 
let objA = {name:"MyObject1",type:"Obj",myvalue:10}
let objB = {name:"MyObject2",type:"Obj2",age:10}

let ObjC = {...objA,...objB}
console.log('Maastering Js Combo Oject>>>>>',ObjC)

//Shallow copy not using referenvce for copy
let arr10 = ["x","hhhshjhs","sdhjfjwkjdek","dkjwfhjwekj"]
let arr11 = [...arr10]
arr11.push("Work Hard This one ")

console.log('Checking old>>>>>',arr10)
console.log('Checking @new>>>>>',arr11)




}

}