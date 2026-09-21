import 'dart:convert';

import 'package:firebase/practiceProject/data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class GalleryController  extends GetxController {
    var products = <Productsmodel>[].obs;
    var filterProducts = <Productsmodel>[].obs ;
    var favourites = [].obs ; 
    var isloading = false.obs;
    final storage = GetStorage(); 
    final  searchController = TextEditingController(); 

  @override
  void onInit() {
   fetchProducts() ;
   favourites.value = storage.read("favourites") ?? [] ;
  }

  Future fetchProducts()  async {
    isloading.value = true ;
    try {
     final response = await http.post(Uri.parse("https://logixadev.com/SarmadFarid/EcomApp/getAllProducts.php")); 
     
     if(response.statusCode == 200) {
      isloading.value = false ;
      final decoded = jsonDecode(response.body); 
      
      if(decoded['Success'] == "true"){
      final List<dynamic> data = decoded['data']; 
       products.value = data.map((e) => Productsmodel.fromJson(e)).toList() ;
       filterProducts.assignAll(products); 
       print("filter products : $filterProducts]"); 
      }
      else {
       Get.snackbar("Eror!", decoded['message']); 
      }
     }
     else {
      Get.snackbar('Server Error' , "Failed to load products"); 
      print("failed to load products");  
      isloading.value = false ;
     }
    }
    catch (e) {
      Get.snackbar("Network error" , "please try again!");
      print("network error : $e"); 
      isloading.value = false ;
    }
  }
  
  void filter(String query){ 
    if(query.isEmpty) {
      filterProducts.assignAll(products); 
    }
    filterProducts.assignAll(
      products.where( (p) {
         return p.name.toLowerCase().contains(query.toLowerCase()); 
    }).toList()
    ); 
  }

   void toggleFav(int id) {
    if(favourites.contains(id)) {
      favourites.remove(id); 
      // Get.snackbar("Removed", "Favourite item removed successfully"); 
    } 
    else {
      favourites.add(id); 
        // Get.snackbar("Success", "Favourite item added successfully"); 
    }
      storage.write("favourites", favourites); 
   }

   bool isfav(int id) {
    return favourites.contains(id); 
   }
  
  

}