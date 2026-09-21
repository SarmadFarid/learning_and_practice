import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; 
import 'package:google_fonts/google_fonts.dart';
class RoadmapTasks extends StatefulWidget {
  const RoadmapTasks({super.key});

  @override
  State<RoadmapTasks> createState() => _RoadmapTasksState();
}

class _RoadmapTasksState extends State<RoadmapTasks> {
  List numbers = [1,2,3,4,89,56,78,234, 46] ; 
  int currentIndex = 0; 
  List pages = [
    Text("home page"), 
    Text("category page"), 
    Text("wishlist page"),  
  ] ; 
    
  void onTapIndex(int index) {
      setState(() {
        currentIndex = index; 
      });
    }
   
   final picker =  ImagePicker(); 
    File? image; 
    String? imageName ;

   Future<void> imageGallery() async {
    final picked = await picker.pickImage(source: ImageSource.gallery) ;
    if(picked != null) {
      image = File(picked.path); 
      imageName = picked.name;
      setState(() {});
    } 
   }

   Future<void> imageCamera() async {
    final picked = await picker.pickImage(source: ImageSource.camera); 
    if(picked != null) {
      image = File(picked.path) ;
      imageName = picked.name;
      setState(() {});
    }
   }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController(); 
    //  get odd numbers 
  void oddnumbers() {
    for (var number in numbers) {
      if(number % 2 == 0) {
        print("Odd numbers: $number");
      }
    }
  }

  //  fetch data using stream 
  //  Stream<List<dynamic>>  fetchData() async* {
  //  try {
  //   final response = await http.post(Uri.parse("https://url"));
  //   final result = jsonDecode(response.body) ; 
  //   if(response.statusCode == 200) { 
  //     if(result['status'] == "success") {
  //      yield result['data']; 
  //     }
  //     else {
  //       yield []; 
  //       print("invaild server response: ${result['message']}") ;
  //     }
  //   }
  //   } catch (e) {
  //     print("server error $e"); 
  //   }
  //  }

  //  void displayData() async {
  //    await for ( var data in fetchData() ) {
  //      print("fetched data: $data"); 
  //    }
  //  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title:Text("RoadMap Tasks"), 
        centerTitle: true,
       ), 
       body: Padding(padding: EdgeInsets.all(20), 
        child: Column(
          children: [
          //   // stream builder 
          //   StreamBuilder(
          //     stream: fetchData() , 
          //     builder: (context, snapshot) {
          //       if(!snapshot.hasData) {
          //         return CircularProgressIndicator(); 
          //       }
          //       final data = snapshot.data! ;
          //       return ListView.builder(
          //         itemCount: data.length,
          //         itemBuilder: ( context,  index) {
          //           return  ListTile(
          //             title: Text(data[index]['name']),
          //           );
          //         }, 
          //       ); 
          //     } , 
          //     )
          //  , 

            // form with validation using global key
              pages[currentIndex], 
             SizedBox(height: 30,), 

            // pick image form   camera and gallery
              Row( 
                children: [
                  InkWell(
                    onTap: () {
                      imageGallery(); 
                    },
                    child: Icon(Icons.upload_file),
                  ), 
                  SizedBox(width: 10,), 
                  InkWell(
                    onTap: () {
                      imageCamera(); 
                    },
                    child: Icon(Icons.camera),
                  ), 
                ],
              ) ,
               image == null ? 
                  Text("image not picked") : 
                  // Image.file(image!, height: 40, width: 40, fit: BoxFit.cover,) ,
                  //  Text("image name bsync: ${imageName ?? ".."}", style: GoogleFonts.montserrat(fontWeight: FontWeight.w800, fontSize: 16, letterSpacing: 0),),
  
              //  SizedBox(height: 30,), 

              //  TabBar(
              //   tabs: [
              //     Tab(
              //       text: "text one",
              //     ), 
              //     Tab(
              //       text: "text two",
              //     ), 
              //   ]
              //   ),

        

               SizedBox(height: 30,), 
              Form(
              key: _formkey,
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade200,
                hintText: "enter your name", 
              ),
              validator: (value) {
               if(value!.isEmpty ) return "field required"; 
               return null ;
              },
            ) , 
            ), 
               ElevatedButton(
              onPressed: () {
                if(_formkey.currentState!.validate()) {
                  print("form valid"); 
                }
              } , 
              child:  Text("Submit"),
              ),
              
              Expanded(
                child:ListView(
                  shrinkWrap: true,
                children: [
                  for (int i = 0 ; i<=25 ; i++ )
                  Text("$i"), 
                  
                ],
                ) , 
                ) 
             
          ],
        ),
       ),
       bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, 
        onTap: onTapIndex,
        items: [
           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home") ,
           BottomNavigationBarItem(icon: Icon(Icons.category), label: "Category") ,
           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Wishlist") ,
        ] ,
        ),
    );
  }
}

//  oop based sutudent grades 
//  class Student {
//   String name ;
//   int rollNumber ; 
//   List grades = [] ; 

//   Student(this.name, this.rollNumber) ;
  
//   void addGrade( grade) {
//     grades.add(grade); 
//   }
  
//   void displayinfo() {
//     print("Student name : $name");
//     print("Student rollNumber : $rollNumber");
//     print("Student grades : $grades");
//   }
 
//  } 

// void main () {
//   Student s1 = Student("Sarmad Farid", 1) ;
//   Student s2 = Student("Yaseen", 2); 
//   Student s3 = Student("Shoaib", 3); 
  
//   s1.addGrade(16); 
//   s1.addGrade(17);  
//   s1.displayinfo(); 

//   s2.addGrade(19); 
//   s2.addGrade(30); 
//   s2.displayinfo(); 
  
//   s3.addGrade(20); 
//   s3.addGrade(10); 
//   s3.displayinfo(); 
//  }
