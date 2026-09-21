import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:http/http.dart' as http;

class RegisterPractice extends StatefulWidget {
  const RegisterPractice({super.key});

  @override
  State<RegisterPractice> createState() => _RegisterPracticeState();
}

class _RegisterPracticeState extends State<RegisterPractice> {

  final _formKey = GlobalKey<FormBuilderState>(); 
    bool _obsecurePas = false ; 
    bool _isloading = false; 

    Future<void> register() async {      
       
      final valid = _formKey.currentState!.saveAndValidate();
      
        if(valid != true) {
          Get.snackbar("Error", "Form is inValid"); 
          return; 
        } 
           
         final formData = _formKey.currentState!.value; 
         final jsonBody = jsonEncode(formData);  
          setState(() {
         _isloading = true ; 
          });
      try {
         
         final response = await http.post(Uri.parse("https://logixadev.com/SarmadFarid/EcomApp/register.php"), 
            body: jsonBody, 
         ); 
         
         if(response.statusCode == 200){
          final responseData = jsonDecode(response.body); 
           setState(() {
         _isloading = false ; 
          });
          if(responseData['Success'] == "true") {
            Get.snackbar("Success", responseData['message']); 
             setState(() {
             _isloading = false ; 
              });
          }
          else {
            Get.snackbar("Error", responseData['message']);
            setState(() {
            _isloading = false ; 
             });
          }
         }

      }
      catch (e) {
        print("Error during Registration: $e"); 
         setState(() {
         _isloading = false ; 
          });
      }
    }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body:SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: FormBuilder(
        key: _formKey,
        child:  Column(
          children: [
            SizedBox(height: 100,), 
           Text( 'Create Account', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
           SizedBox(height: 60,), 
          
           FormBuilderTextField(
            name:"username",
            keyboardType: TextInputType.text, 
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9_]')),
            ],
            decoration: InputDecoration(
              border: OutlineInputBorder(), 
              labelText: "Username", 
              labelStyle: TextStyle(fontSize: 18),
            ),
            validator:FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: "Username is required"), 
              FormBuilderValidators.minLength(6), 
              FormBuilderValidators.maxLength(20), 
            ]),
            ), 
              SizedBox(height: 30,),
             FormBuilderTextField(
            name:"email",
            keyboardType: TextInputType.emailAddress, 
            decoration: InputDecoration(
              border: OutlineInputBorder(), 
              labelText: "Email", 
              labelStyle: TextStyle(fontSize: 18),
            ),
            validator:FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: "Email is required"), 
              FormBuilderValidators.email(errorText: "Invalid email address"), 
            ]),
            ), 
              SizedBox(height: 30,),
             FormBuilderTextField(
              name:"password",
              obscureText: _obsecurePas,
             keyboardType: TextInputType.text, 
             decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: (){
                  setState(() {
                    _obsecurePas = !_obsecurePas; 
                  });
                },
                 icon: Icon(_obsecurePas ? Icons.visibility_off : Icons.visibility)),
              border: OutlineInputBorder(), 
              labelText: "Password", 
              labelStyle: TextStyle(fontSize: 18),
             ),
             
             validator:FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: "Password is required"), 
              FormBuilderValidators.password(errorText: "enter secure password"),
              FormBuilderValidators.minLength(8, errorText: "Password msut be at least 8"), 
              FormBuilderValidators.maxLength(15, errorText: "Password must not exceed 15"), 
             ]),
             ), 
              SizedBox(height: 50,),
              
                ElevatedButton(
                 onPressed:(){
                  if(_formKey.currentState!.saveAndValidate()) {
                    print(_formKey.currentState!.value); 
                    register(); 
                  _formKey.currentState!.reset(); 
                  }
                  else {
                    print("Validation failed"); 
                  }
                } ,
                 style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), 
                 shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6), 
                 )
                 ),
                 child: Text(_isloading ? "loading..." : "Register")
                 ), 

             

          ],
        )  
        ),
     ),
    ); 
            
    }
}