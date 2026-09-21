abstract class Product {
  int id;  
  String name; 
  int _price;
  int _qunatity; 
  
  Product(this.id, this.name, this._price, this._qunatity);

  void displayDetail();  
}

mixin Discount{
  double applyDiscount(double  price, double percent){
   return price - ( price * percent/100 ) ;
  }
}

mixin StockAlert{
 void checkStock(int qunatity , String name){
   if(qunatity < 5) {
      print("⚠️ $name Low stock alert!");
   }
   else {
     print("✅ $name Stock level is fine.");
   }
 }
}

class Electronics extends Product with Discount , StockAlert {
 String warrantyMonths ; 
 Electronics(this.warrantyMonths, int id , String name, int _price, int _qunatity) : super(id, name, _price, _qunatity); 

 @override
  void displayDetail() {
   print("product: $name \n price: $_price \n qunatity: $_qunatity \n size: $warrantyMonths");
  }  
}

class Groceries extends Product with Discount ,StockAlert{ 
String expiryDate ; 
Groceries( this.expiryDate ,int id , String name, int _price, int _qunatity) : super(id, name, _price, _qunatity);

@override
  void displayDetail() {
    print("product: $name \n price: $_price \n qunatity: $_qunatity \n size: $expiryDate");
  }

}

class Clothing extends Product with Discount , StockAlert{
String size ; 


Clothing(this.size, int id , String name , int _price , int _quantity ) : super(id , name , _price, _quantity);

@override
  void displayDetail() {
   print("product: $name \n price: $_price \n qunatity: $_qunatity \n size: $size");
  }

}


class InventoryManager with Discount, StockAlert{


 List<Product> _products = [];  

 void addProduct(Product product) {
  if(_products.any((p) => p.id == product.id) ) {
    print("product with ${product.id} not exists"); 
    return; 
  } 
  _products.add(product); 
  print("product added : ${product.name}"); 
 } 

 void removeProduct(int id) { 
  _products.removeWhere((p) => p.id == id  );
  print("product remove with id : $id"); 
 }
 
 void updateProduct(int id, String newName , int newPrice, int  newQuantity){
   final index = _products.indexWhere((p) => p.id == id); 
   if(index != -1){
    _products[index]._price = newPrice ;
    _products[index]._qunatity = newQuantity ;
    _products[index].name = newName ;
    print("product update with ${_products[index].name}"); 
   }
 }

 void showAllProducts(){
  for(var product in _products){
  product.displayDetail(); 
  print("--------------"); 
 }
 }

 void applyDiscountToAll(double percent){
 for (var product in _products) {
  var discountedPrice = applyDiscount(product._price.toDouble(), percent); 
  print("Product name: ${product.name} , discounted price: $discountedPrice"); 
 }
 }

 void checkAllStock(){
  for (var product in _products) {
    checkStock(product._qunatity, product.name); 
  }
 }

}

void main() {
var inventory = InventoryManager(); 

 var phone = Electronics("12 months", 1, "IPhone", 150000, 6);
 var shirt = Clothing("L", 2, "t-shirt", 2000, 10);
 var rice =  Groceries("2025-12-10", 3, "Basmati rice", 3500, 2);
  
  inventory.addProduct(phone); 
  inventory.addProduct(shirt); 
  inventory.addProduct(rice); 

  inventory.showAllProducts(); 
  inventory.applyDiscountToAll(10); 
  inventory.checkAllStock();   
  
  inventory.removeProduct(2); 
  inventory.updateProduct(1, "infinix hot 40", 40000, 10); 
  inventory.showAllProducts();
}