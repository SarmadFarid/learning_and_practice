//  Register 

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class firebaseCode extends StatefulWidget {
  const firebaseCode({super.key});

  @override
  State<firebaseCode> createState() => _firebaseCodeState();
}

class _firebaseCodeState extends State<firebaseCode> {

  // Register
  Future<void> Register(String email, String pass) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);
  }  

  //  login
  Future<void> login(String email, String pass) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
  }
   
   // logout
   Future <void> logout() async {
    await FirebaseAuth.instance.signOut(); 
   }
   
  //  add data 
  Future<void> addData(String name, int age) async {
    await FirebaseFirestore.instance.collection("users").add({
      'name': name,
      'age': age
    });
  }

  // Read Data 
  Future <void> readData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("users").get();
    for (var doc in querySnapshot.docs) {
      print("Name: ${doc['name']}, Age: ${doc['age']}");
    }
  } 

  // update data 
  Future<void> updateData(String docId, String name, int age) async {
    await FirebaseFirestore.instance.collection("users").doc(docId).update({
      'name': name,
      'age': age
    });
  }

  // delete data 
  Future<void> deleteData(String docId) async {
    await FirebaseFirestore.instance.collection("users").doc(docId).delete();
  } 
   
  // read specific document
  Future read() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection("users").doc("specific_doc_id").get();
    if (documentSnapshot.exists) {
      print("Name: ${documentSnapshot['name']}, Age: ${documentSnapshot['age']}");
    } else {
      print("Document does not exist");
    }
  }

  //  Real time stream 
   streamBuilder () {
    StreamBuilder(
      stream: FirebaseFirestore.instance.collection("users").snapshots(),  
     builder:  (context, snapshot ) { 
      if( snapshot.hasError) {
        return Text("Error: ${snapshot.error}"); 
      }  
      if(snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator(); 
      }
     
      final  data = snapshot.requireData; 
       return ListView.builder(
       itemCount: data.docs.length,
       itemBuilder: (BuildContext context, int index) {
         return ListTile(
           title: Text(data.docs[index]['name']),
           subtitle: Text("Age: ${data.docs[index]['age']}"),
         );
       },
     );
     }
    ); 
  }
  
  // upload file 
  Future uploadFile(File file) async {
    try {
      // Get a reference to the Firebase Storage instance
      FirebaseStorage storage = FirebaseStorage.instance;

      // Create a reference to the location where you want to upload the file
      Reference ref = storage.ref().child("uploads/${DateTime.now()}.png");

      // Upload the file
      await ref.putFile(file);
      print("File uploaded successfully");
      // Optionally, get the download URL
      return await ref.getDownloadURL();

    } catch (e) {
      print("Error uploading file: $e");
    }
  }
  
  // push notification 
  Future notification ()async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;  
  NotificationSettings settings = await messaging.requestPermission();  

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
  String? token = await messaging.getToken(); 
  print("FCM token : $token"); 
  }

   



  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

