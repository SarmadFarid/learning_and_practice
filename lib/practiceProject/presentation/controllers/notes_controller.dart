import 'package:firebase/practiceProject/data/models/notes_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NotesController extends GetxController {
  var notes = <NotesModel>[].obs;
  final storage = GetStorage(); 
  var isloading = false.obs; 
  
  @override
  void onInit() {
    loadNotes(); 
    super.onInit();
  }
  
  void loadNotes() {
    isloading.value = true ;
    final List stored = storage.read("notes") ?? []; 
    notes.value = List<NotesModel>.from(
      stored.map( (e) => NotesModel.fromJson(e))
    ); 
    isloading.value = false ;
  }

  void saveNotes() {
    final list = notes.map( (e) => e.toJson()).toList();
    storage.write("notes", list);  
  }

  void addNotes(String title, String content) {
   final note = NotesModel(title: title, content: content, createdAt: DateTime.now()); 
   notes.add(note); 
   saveNotes(); 
  }

  void editNotes(int index ,String title, String content) {
    notes[index] = NotesModel(title: title, content: content, createdAt: DateTime.now()); 
    saveNotes(); 
  }

  void delete(int index) {
    notes.removeAt(index); 
    saveNotes(); 
  }
  
}