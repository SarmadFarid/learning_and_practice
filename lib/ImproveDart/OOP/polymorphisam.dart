// Polymorphisam: it means "many forms", the ability of one fucntion method or object to behave differently in different situations.  

// Types of polymorphisam: 
// compile time polymorphisam(method overloading):  multiple method with same name but different parameters(not supported in dart directly). 

// runtime polymorphisam(method overriding): when child class gives its own versoin of method from parent class .

// Advantages: 
// Code reuseability , flexibility , clean design , 

  
// Task: Shape Polymorphism System

class Shape{
  String name; 
  Shape(this.name); 

  void area(){
   print("Calculating Area for $name ") ;
  } 
  void displayName(){
    print("This is $name"); 
  }

}

class Circle extends Shape{
  double radius; 
  Circle(this.radius) : super("Circle"); 

  @override
  void area() {
  double result = 3.14 * radius * radius ;   
   print("Area of $name : $result"); 
  } 
  @override
  void displayName(){
  print("this is $name"); 
  }
} 

class Rectangle extends Shape{
  double length; 
  double width; 
  Rectangle(this.length, this.width) : super("Rectangle");  
  @override
  void area() { 
   double result = length * width ; 
   print("Area of $name : $result"); 
  }
  @override
  void displayName() {
    print("this is $name"); 
    } 
}

class Triangle extends Shape{
  double base ;
  double height;  
  Triangle(this.base, this.height) : super("Triangle"); 

  @override
  void area() { 
    double result = 1/2 * base * height ;
    print("area of $name : $result");  
  }
  @override
  void displayName() {
    print("this is $name"); 
  } 
}



void main() {
  Shape s1 = Circle(40);  
  Shape s2 = Rectangle(60, 30);  
  Shape s3 = Triangle(20, 50);  

  s1.displayName(); 
  s1.area(); 

  s2.displayName(); 
  s2.area(); 

  s3.displayName(); 
  s3.area(); 
}