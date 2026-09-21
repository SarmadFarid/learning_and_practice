import 'dart:convert';

class Task {
  final int id; 
   String title; 
   bool isCompelete; 

  Task({required this.id, required this.title, this.isCompelete = false}) ;  
    // convert task ---> map for savving 
    Map<String, dynamic> toJson() {
    return   { 
        'id': id ,
        'title':title, 
         'isCompeleted':isCompelete
      }; 
    }
  
  //  convertt map ---> task for loading
  factory Task.fromJson(Map<String, dynamic> json) {
   return Task(
    id: json['id'],
     title: json['title'] , 
     isCompelete: json['isCompeleted']
    ); 
  }

  
 

   


  void toggleStatus() {
    isCompelete = !isCompelete; 
  }
}