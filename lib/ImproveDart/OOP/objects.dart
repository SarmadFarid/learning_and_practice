// Object: 
// An onject is an instance of the class that represents real world entity. It is a block of memory that stores the data defined by the class's properties and can perform actions thorugh its methods. 

// Instantiation: 
// It is the process of creating an instance of the class. 

class Bicycle {
  String? name ;
  int? currentSpeed; 
  int? size; 

  void changeGear(int value) {
    currentSpeed = value ;
  }

  void displayInfo() {
    print("Bike name : $name \n Current speed : $currentSpeed \n bike size : $size"); 
  } 
}


void main() {
  // object of Bicycle 
  Bicycle bike =  Bicycle() ; 
  bike.displayInfo(); 
  bike.name = "yahama" ;
  bike.size = 5 ;
  bike.currentSpeed = 80 ; 

  bike.displayInfo(); 
}