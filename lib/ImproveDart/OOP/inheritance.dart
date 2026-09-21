// Inheritance: is a sharing behavior betweeen two classes . it allows you to define a class that extends the functionality of another class. 

// Dart supports signle inheritance. which means that a class only inherit form a single class. Dart does not support multiple inheritence which means that a class cannot inherit from multiple classes. 

// Terminology :
// Parent class: the class whose properties and methods are inherited by another class is called parent class. It is also known as base class or super class. 

// Child class: the class that inherits the properties and method of another class is called child class. it is alos known as derived class or subclass . 

// advantages :
// It promotes reusability of the code and reduces redundant code.
// It helps to design a program in a better way.
// It makes code simpler, cleaner and saves time and money on maintenance.
// It facilitates the creation of class libraries.

// ----->Types of inheritcance in dart -------> 

// 1. Single inheritance : in this type of inheritance a class can inherit from only one class . In dart , we can extend only one class at a time .  

// 2. Mulitlevel inheritance : in this type , a class can inherit form another class and that class can also inherit form another class . In dart , we can extend a class form anoter class which is already extended form another class .  

// 3. Heirarchical inheritance : In this type , a parent class is inherited by mulitple sub classes .
 

 

// void main() {
//   //  task1
//   //  Student s = Student(18, "Sarmad Farid", "17"); 
//   //  Teacher t = Teacher(28, "Imran", "17", "English"); 
//   //  s.introduce(); 
//   //  s.study();
//   //  t.introduce(); 
//   //  t.teach(); 

//   //  task2
//   //  SavingsAccount sAcc = SavingsAccount(5, 10000, "SA123"); 
//   //  sAcc.displayBalance(); 
//   //  sAcc.deposit(2000); 
//   //  sAcc.calculateInterest(); 
//   //  sAcc.displayBalance(); 
//   //  sAcc.widraw(1900); 
//   //  sAcc.displayBalance();  
//   //  print("-------------"); 
//   //  CurrentAccount cAcc = CurrentAccount(6000, 5000, "SA123"); 
//   //  cAcc.widraw(4000); 
//   //  cAcc.displayBalance(); 
//   //  cAcc.checkOverDaraft();  
//   //  cAcc.displayBalance(); 

//   //  task3  
//   Car car = Car("Petrol", 5, "Tyota", "Crolla" , 0 ); 
//   Bike bike = Bike(true, "sports", "Yahma", "R15", 0); 
  
//   car.start(); 
//   car.honk(); 
//   car.displayInfo(); 
//   bike.start(); 
//   bike.wheelie(); 
//   bike.displayInfo(); 
//   car.stop(); 
//   bike.stop(); 

// }  

// practice tasks
// --- Task 1 ----  school system 
 
 class Person{
  String name ; 
  int age ; 
  
  Person(this.age, this.name); 

 void introduce() {
  print("Hi, I'm ${name}, and I'm ${age} years old."); 
 }
 }

class Student extends Person{
  String grade;
  // Student(int age, String name, this.grade) : super(age, name);
  Student(String name, int age, this.grade) : super(age, name); 
  void study() {
    print("i am struding in grade ${grade}");
  }
  
}


class Teacher extends Student {
String subject; 
Teacher(int age , String name,  String grade, this.subject): super(name , age, grade); 

void teach(){
 print('i teach ${subject}');
}
}

// --- Task 2 ---- Bank account system 

class BankAccount{
late String accountNumber; 
late double balance; 

BankAccount(this.balance, this.accountNumber); 

 void deposit(double amount){
  balance += amount ;
 print("Deposit $amount Successfully");
 } 

 void widraw(double amount){
 if(amount <= balance){
  balance -= amount; 
 print("Withdrawn ${amount} successfully");
 } else {
  print("Insufficient balance!"); 
 }
 } 

 void displayBalance() {
 print("Current balance: ${balance}");
}

} 

class SavingsAccount extends BankAccount{
double interestRate; 
  SavingsAccount(this.interestRate, double balance, String accountNumber) : super(balance,accountNumber ); 

void calculateInterest(){
  double interest =  balance * interestRate / 100; 
  print("Interest earned: $interestRate");
  balance += interest ;
}
}

class CurrentAccount extends BankAccount{
double overdraftLimit; 
CurrentAccount(this.overdraftLimit,double balance, String accountNumber ) : super(balance, accountNumber); 

void checkOverDaraft(){
if(balance < 0 && balance > overdraftLimit) {
  print("⚠️ Overdraft limit exceeded!");
    } else {
      print("✅ Within overdraft limit.");
    }
 }
}

// --- Task 3 ---- Vehicle management system
 
class Vehicle {
  String brand; 
  String model;
  double speed; 
  Vehicle(this.brand, this.model, this.speed); 
  
  void start(){
  print("Vehicle is starting with key ignition"); 
  }
  void stop() {
  print("Vehicle engine stopped."); 
  }
  void displayInfo(){
  print("Vehicle :\nBrand: $brand, Model: $model, Speed: $speed "); 
  }

}

class Car extends Vehicle {
 int seats ; 
 String fuelType; 
 Car(this.fuelType, this.seats, String brand, String model, double speed ) : super(brand, model, speed);

  @override
 void start() {
  print("Car is starting with key ignition"); 
 }  
 @override
 void stop(){ 
  print("Car engine stopped"); 
 }
 void honk() {
 print("Beep! Beep!"); 
 }

}

class Bike extends Vehicle {
  String type; 
  bool  hasGear; 
  Bike(this.hasGear, this.type, String brand, String model, double speed ) : super(brand, model, speed); 
  
  @override
  void start(){
  print("Bike is starting with self/start kick"); 
  }
  @override
  void stop() {
  print("Bike stopped safely");
  }
  void wheelie(){
  print("Bike is doing a wheelie!"); 
  }
}

