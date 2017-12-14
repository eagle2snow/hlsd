var size = 1.0;  
function zoomout() {  
   size = size + 0.2;  
   set(); 
}  

zoomin() 
function zoomin() {  
   size = size - 0.15;  
   set();  
}  


function set() {  
// document.body.style.cssText = document.body.style.cssText + '; -webkit-transform: scale(' + size + ');-webkit-transform-origin: 0 0;';   
// document.body.style.cssText = document.body.style.cssText + '; -webkit-transform: scale(' + size + '); '; 
// $(body).css("width","120%");
document.body.style.zoom = size;
//document.body.style.cssText += '; -moz-transform: scale(' + size + ');-moz-transform-origin: 0 0; ';     //

} 