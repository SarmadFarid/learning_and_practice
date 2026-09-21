import 'package:cloud_firestore/cloud_firestore.dart';
 import 'package:flutter/material.dart';
 

class Showdata extends StatefulWidget {
  const Showdata({super.key});

  @override
  State<Showdata> createState() => _ShowdataState();
}

class _ShowdataState extends State<Showdata> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show data"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots() ,
         builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.active) {
             if(snapshot.hasData) {
              return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                   var user = snapshot.data!.docs[index].data() ; 
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text("${index+1}"),
                      ),
                      title: Text("${user["name"] ?? ''}"),
                      subtitle: Text("${user["email"] ?? ''}"),
                    );
                 },
               );
             } 
             else if(snapshot.hasError) {
               return Center(child: Text("${snapshot.error} has error"),); 
             } 
              else {
              return Center(child: Text("no data found "),); 
             }
          } 
          else {
            return Center(child: CircularProgressIndicator(),); 
          }
         }),
    );
  }
}

