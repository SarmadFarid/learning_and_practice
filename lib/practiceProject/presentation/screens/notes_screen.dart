import 'package:firebase/practiceProject/presentation/controllers/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesScreen extends StatelessWidget {
   NotesScreen({super.key});

   final NotesController c = Get.put(NotesController()); 
   final titleController = TextEditingController(); 
   final contentController = TextEditingController(); 

   void showNotesDialog(int? index) {
    if(index != null) {
      titleController.text = c.notes[index].title; 
      contentController.text = c.notes[index].content; 
    }
    else {
      titleController.clear(); 
      contentController.clear(); 
    }

    Get.defaultDialog(
      title: index == null ? "Add notes" : "Edit notes" , 
      content: Column(
        children: [
          TextField(
            controller: titleController, 
            decoration: InputDecoration(
              hintText: "Title"
            ),
          ), 
          TextField(
            controller: contentController, 
            decoration: InputDecoration(
              hintText: "Content"
            ),
          ),
        ],
      ), 
      confirm: ElevatedButton(
        onPressed:(){
          if(index == null) {
            c.addNotes(titleController.text, contentController.text); 
          }
          else {
            c.editNotes(index, titleController.text, contentController.text); 
          }
          Get.back(); 
        } , 
        child: Text(index == null ? "Add" : "Edit"), 
        ), 
        cancel: TextButton(onPressed: (){
          Get.back(); 
        }, child: Text("Cancel")), 
    ) ;
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My notes", style: GoogleFonts.montserrat(
        fontSize: 20, 
        fontWeight: FontWeight.w600
      ),), 
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showNotesDialog(null); 
        } , 
        child:Icon(Icons.add) ,
      ),
      body: Obx(() => 
      c.notes.isEmpty ? 
      Center(child: Text("No notes yet"),) :
      ListView.builder(
        itemCount: c.notes.length,
        itemBuilder: (BuildContext context, int index) {
          var note = c.notes[index] ;
          return Dismissible(
            key: UniqueKey(), 
            background: Container(color: Colors.white,),
            onDismissed: (_) => c.delete(index),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Card(
                elevation: 4, 
                margin: EdgeInsets.all(8),
                child: ListTile(
                  title: Text(note.title),
                  subtitle: Text(note.content),
                  trailing: IconButton(
                    onPressed: (){
                      showNotesDialog(index); 
                    } , 
                    icon: Icon(Icons.edit)),
                ),
               ),
            ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.3, duration: 400.ms, curve: Curves.easeInOut), 
            );
        },
      ),
      ) ,
    );
  }
}