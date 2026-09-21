
// Encapsulation: means wrapping data and method in one unit class and hidding the real data from outside the world . 

// example without encapsulation  
// class Student {
//   String name = ""; 
//   int age = 0; 
//   } 
// void main() {
//   Student s = Student() ;
//   s.name = "Ali"; 
//   s.age = -5 ;  // wrong data 
//    print("${s.name}, ${s.age}");
// }

// Problem: anyone can set the wrong data(-5) like this ecample. 
// Data is not protected --> no cotrol --> error phone code. 

// Encapsulation fixed this issue 
// We make variables private (using _underscore)
// and give controlled access through getters and setters. 

// Private variables : if u start a variable with underscore(_) it become private to that library level rahter than class level. 

// class Person {
//    String _name = "";
//   int _age = 0;  
//   Person(this._age, this._name);  
  
//   //  getter
//   String get name => _name ; 
//   // setter 
//   set name(String value) {
//     if(name.isNotEmpty) {
//       _name = value ; 
//     } 
//     else {
//       print("name cannot be empty");  
//     }
//   } 

//   // getter  
//   int get age => _age ; 
//   // setter   
//   set age(int value){
//   if(age > 0 ){
//    _age = value ;
//   } 
//   else {
//     print("age must be positive"); 
//   }
//   }
// }
// void main() {
// Person p = Person(18, "Sarmad Farid"); 
// print("Name:  ${p.name}") ; 
// print("Age: ${p.age}"); 
// }

// ---------> why we use encapsulation: 
// data hidding (prevent unwanted changes to variable) , data validation (allow rules , age canot be negative) , reuseability , maintenance 

// Getter: getter used to read private variable ---- String get name => _name;  ---
// Setter : setter used to set the private variable --- String set name (String newname) => _name = newname; ----


// task  Bank Account Encapsulation System
class SecureBankAccount {
 final String _accountNumber; 
  double _balance ; 
  double lastDeposit = 0; 
  double lastWithdrawal = 0; 
  SecureBankAccount(this._accountNumber, this._balance) ;
  double get balance => _balance;  
  set balance(double value) {
    if(value >= 0) {
   _balance = value ; 
  }  else {
    print("amount connot be negative ") ;
  }
} 

  void deposit(double amount){
    if(amount >= 100 ) {
      _balance +=  amount ; 
      lastDeposit = amount;  
      print("deposit $amount successfully"); 
    } 
    else {
     print("minimun deposit 100! is must"); 
    }
  }
  
  void widraw(double amount){
    if(amount <= _balance) {
      _balance -= amount ;  
      lastWithdrawal = amount; 
      print("widraw $amount successfully"); 
    }
    else {
      print("limit exceed ! \n widraw under $balance !"); 
    }

  }
  
  void displayInfo(){
    print("🏦 Account Number: $_accountNumber");
    print("💰 Current Balance: $_balance");
    print("📥 Last Deposit: $lastDeposit");
    print("📤 Last Withdrawal: $lastWithdrawal"); 
  }

}

void main() { 
//   task 
SecureBankAccount bank = SecureBankAccount("ACCA", 5000);  
bank.displayInfo(); 
bank.deposit(3000);
bank.displayInfo(); 
bank.widraw(6000); 
bank.displayInfo(); 
 
}

