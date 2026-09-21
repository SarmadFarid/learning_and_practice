class Productsmodel {
  final String id;
  final String name; 
  final String image; 
  final String salePrice; 

  Productsmodel({
    required this.id, 
   required this.name, 
   required this.image, 
   required this.salePrice
  }) ; 

  factory Productsmodel.fromJson(Map json) {
    return Productsmodel(
      id: json['id'].toString(),
      name:json['name'] , 
      image: json['image'],
      salePrice:json['salePrice'], 
      ); 
  }  
}