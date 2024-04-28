import { LightningElement } from 'lwc';

export default class CustomCarousel3d extends LightningElement {
    
handleClick1(){
    console.log('HandleClick click');
    }
       
handleClick2(){
    console.log('HandleClick click');
    }
       
handleClick3(){
    console.log('HandleClick click');
    }
       
handleClick4(){
    console.log('HandleClick click');
    }
       
handleClick5(){
    console.log('HandleClick click');
    }
           
handleClick6(){
    console.log('HandleClick click');
    }
           
handleClick8(){
    console.log('HandleClick click');
    }
           
handleClick9(){
    console.log('HandleClick click');
    }
           
handleClick10(){
    console.log('HandleClick click');
    }
           
handleClick11(){
    console.log('HandleClick click');
    }
           
handleClick12(){
    console.log('HandleClick click');
    }
           
handleClick13(){
    console.log('HandleClick click');
    }

    renderedCallback(){
        var carousel = this.template.querySelector('.carousel');
var cells = carousel.querySelectorAll('.carousel__cell');
var cellCount; // cellCount set from cells-range input value
var selectedIndex = 0;
var cellWidth = carousel.offsetWidth;
var cellHeight = carousel.offsetHeight;
var isHorizontal = true;
var rotateFn = isHorizontal ? 'rotateY' : 'rotateX';
var radius, theta;
// console.log( cellWidth, cellHeight );

function rotateCarousel() {
  var angle = theta * selectedIndex * -1;
  carousel.style.transform = 'translateZ(' + -radius + 'px) ' + 
    rotateFn + '(' + angle + 'deg)';
}

var prevButton = this.template.querySelector('.previous-button');
prevButton.addEventListener( 'click', function() {
  selectedIndex--;
  rotateCarousel();
});

var nextButton = this.template.querySelector('.next-button');
nextButton.addEventListener( 'click', function() {
  selectedIndex++;
  rotateCarousel();
});

var cellsRange = this.template.querySelector('.cells-range');
cellsRange.addEventListener( 'change', changeCarousel );
cellsRange.addEventListener( 'input', changeCarousel );



function changeCarousel() {
  cellCount = cellsRange.value;
  theta = 360 / cellCount;
  var cellSize = isHorizontal ? cellWidth : cellHeight;
  radius = Math.round( ( cellSize / 2) / Math.tan( Math.PI / cellCount ) );
  for ( var i=0; i < cells.length; i++ ) {
    var cell = cells[i];
    if ( i < cellCount ) {
      // visible cell
      cell.style.opacity = 1;
      var cellAngle = theta * i;
      cell.style.transform = rotateFn + '(' + cellAngle + 'deg) translateZ(' + radius + 'px)';
    } else {
      // hidden cell
      cell.style.opacity = 0;
      cell.style.transform = 'none';
    }
  }

  rotateCarousel();
}
}

}