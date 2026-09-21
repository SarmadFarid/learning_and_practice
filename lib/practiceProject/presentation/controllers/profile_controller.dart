import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
 final storage = GetStorage(); 
   var profileImage = ''.obs ; 

 @override
  void onInit() {
   profileImage.value =  storage.read("pImage") ?? ""; 
    super.onInit();
  }

  Future pickImage() async {
    final picker = ImagePicker(); 
    final picked = await picker.pickImage(source: ImageSource.camera); 
    if(picked != null) {
      profileImage.value = picked.path;
      storage.write("pImage", picked.path) ;
      print("profile image: ${picked.path}"); 
    }
  }

}