// This: 
// When we want to use class perperties and methods within the same clas then we use "this" keyword . This is usefull when the parameter of the method have the same name as the class properties .
// this means current object of the class. 

// Emp  
class Point {
 int x = 0 ;
 int y = 0; 

 void move(int x, int y) {
  this.x = x ; 
  this.y = y ;
 } 

 void show() {
  print("x:$x y:$y"); 
 }
}

void main () {
  Point p = Point(); 
  p.move(10, 5); 
  p.show(); 
}


