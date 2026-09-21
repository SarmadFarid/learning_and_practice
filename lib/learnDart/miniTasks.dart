
void main() {
  List<Map<String, dynamic>> products = [
    {'name': 'Phone', 'price': 120000},
    {'name': 'Earbuds', 'price': 6000},
    {'name': 'Charger', 'price': 2500},
   ];
    
    List numbers = [1,2,3,5,7,8, 12, 23, 46 , 58] ; 
    for (var element in numbers) {
      if(element % 2 != 0) {
        print("even numbers : $element"); 
      }
    } 
   

  // 👉 TODO:
  // 1. sirf wo products print karo jinka price > 5000 ho
  // 2. aur unke name uppercase me show karo
}



// TODO: ek class Product banao jisme id, name, price ho
// constructor & display() func add karo
// 3 products banao aur unko list me store karke print karo


// 🧩 Task 3 – try/catch with user input

// Goal: user se 2 numbers lo (simulate using variables), division karo, aur divide-by-zero handle karo.


// 🧩 Task 4 – async/await simulation

// Goal: ek fake API call likho jo 2 second baad data return kare aur print kare “Data fetched: ___”.


// 🧩 Task 5 – mixin + abstract combo (mini-OOP logic test)

// Goal:

// ek abstract class Animal banao jisme makeSound() ho

// ek mixin RunFast banao jisme run() print kare

// 2 classes – Dog & Cat – banao jo Animal se extend aur RunFast use karein

// dono ka output show karo

