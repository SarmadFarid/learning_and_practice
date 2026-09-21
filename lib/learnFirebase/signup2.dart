import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/learnFirebase/uiHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Signup2 extends StatefulWidget {
  const Signup2({super.key});

  @override
  State<Signup2> createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  File? pickerImage;

   signup(String email, String pass) async {
    if (email.isEmpty || pass.isEmpty || pickerImage == null) {
      return Get.snackbar("Alert!", "Enter Required Fields");
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: pass);
        uploadData();
      } on FirebaseAuthException catch (ex) {
        print(ex.code);
      }
    }
  }

    uploadData() async {
     UploadTask uploadTask = FirebaseStorage.instance
        .ref("profile")
        .child(emailController.text.toString())
        .putFile(pickerImage!);

    TaskSnapshot taskSnapshot = await uploadTask;
     String url = await taskSnapshot.ref.getDownloadURL();
 
     FirebaseFirestore.instance
        .collection("Users")
        .doc(emailController.text.toString())
        .set({
      "email": emailController.text.toString(),
      "pass": passController.text.toString(),
      "Url": url,
    }).then((value) {
      Get.snackbar("Success", "User uploaded successfully");
    });
  }

  showAlertBox() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text("Pick image from"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
              leading: Icon(Icons.image, color: Colors.blue),
              title: Text("Gallery"),
            ),
            ListTile(
              onTap: () {
                pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
              leading: Icon(Icons.camera_alt, color: Colors.green),
              title: Text("Camera"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text("Sign Up Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile Image Picker
              InkWell(
                onTap: () {
                  showAlertBox();
                },
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.blue.shade100,
                  backgroundImage:
                      pickerImage != null ? FileImage(pickerImage!) : null,
                  child: pickerImage == null
                      ? Icon(Icons.person, size: 70, color: Colors.white)
                      : null,
                ),
              ),
              SizedBox(height: 30),

              // Email Field
              Uihelper.CustomTextField(
                  emailController, false, "Email", Icons.mail),
              SizedBox(height: 20),

              // Password Field
              Uihelper.CustomTextField(
                  passController, true, "Password", Icons.lock),
              SizedBox(height: 30),

              // Signup Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    signup(emailController.text.toString(),
                        passController.text.toString());
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageSource) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageSource);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickerImage = tempImage;
      });
    } catch (ex) {
      print(ex);
    }
  }
}
