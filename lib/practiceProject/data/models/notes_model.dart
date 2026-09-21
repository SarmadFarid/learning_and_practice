class NotesModel {
 final String title; 
 final String content; 
 final DateTime createdAt; 

 NotesModel({
  required this.title, 
  required this.content, 
  required this.createdAt
 }); 

 Map<String, dynamic> toJson() => {
  'title' : title , 
  'content' : content, 
  'createdAt' : createdAt.toIso8601String()
 } ;
 
 factory NotesModel.fromJson(Map json) {
  return NotesModel(
    title: json['title'], 
    content: json['content'], 
    createdAt: DateTime.parse(json['createdAt'])); 
 }
}


