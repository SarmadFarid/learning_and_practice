// Method Chaining: 
// method chaining allows multiple method to be called on same obeject in a single statement, by returning "this" keyword form each method. 

// why we use the class name as the return type ? 
// we use class name as the return type in method chainig because we return the current object(this) from the method allowing next method to be called on the same object immediately. 


// example 
class Point {
  int x = 0 ;
  int y = 0 ;
 
  Point  move(int x ,int y) {
   this.x = x ;
   this.y = y ;
   return this; 
  }

   Point reset() {
      x = 0; 
      y = 0; 
    return this; 
   }
 
  Point show() {
   print("x $x , y $y"); 
   return this; 
  }

}

void main() {
  Point p = Point(); 
   
  p.move(5, 10).show().reset().show();  
}
