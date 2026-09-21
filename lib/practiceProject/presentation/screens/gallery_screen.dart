import 'package:firebase/practiceProject/presentation/controllers/gallery_controller.dart';
import 'package:firebase/practiceProject/presentation/widgets/shimmer/shimmer_gallelry.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class GalleryScreen extends StatelessWidget {
   GalleryScreen({super.key});

   final GalleryController c = Get.put(GalleryController()); 

  @override
  Widget build(BuildContext context) {
    return  
        Scaffold(
      
          appBar: AppBar(
            toolbarHeight: 80,
          
          title: Container(
            margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity, 
                    height: 55, 
                  decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius: BorderRadius.circular(12), 
                   border: Border.all(color: Colors.black12), 
                   boxShadow: [
                    BoxShadow(
                      color: Colors.black12, 
                    spreadRadius:0.01, 
                    blurRadius: 5
                    )
                   ], 
                   ),
                  child: TextField(
                    controller: c.searchController,
                    onChanged:c.filter,
                    style: GoogleFonts.inter(fontSize: 14, color: Colors.grey.shade700, fontWeight: FontWeight.w500), 
                    decoration: InputDecoration(
                      hintText: "Search products by names", 
                      hintStyle: GoogleFonts.inter(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500),
                      border: InputBorder.none
                    )
                  ),
                  ), 
                   
          ), 
           body: Padding(
             padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
             child: Obx( () =>
               Column(
                children: [
                //  search bar 
                SizedBox(height:10 ,),
                  c.isloading.value ? 
                  ShimmerGallelry() :
                  c.filterProducts.isEmpty ? 
                  Center(child: Text("No products found"),) : 
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, 
                        mainAxisSpacing: 20, 
                        crossAxisSpacing: 20, 
                      ),
                      itemCount: c.filterProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        var product = c.filterProducts[index]; 
                        return Stack(
                          children: [ 
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration( 
                                borderRadius:  BorderRadius.circular(10), 
                                border: Border.all(color: Colors.black12),
                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black12, 
                                                  spreadRadius:0.01, 
                                                  blurRadius: 5
                                                  )
                                                 ], 
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(product.image, fit:  BoxFit.cover,)),
                                                        ),
                            ),
                            
                            Positioned(
                            right: 5, 
                            top: 5,
                            child: Obx( () =>
                              InkWell(
                                onTap: () {
                                  c.toggleFav(int.parse(product.id));
                                  print(product.id); 
                                },
                                child: Container(
                                  // height: 25,
                                  // width: 25,
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white, 
                                    shape: BoxShape.circle
                                  ),
                                  child: Icon( 
                                    c.isfav(int.parse(product.id)) ? Icons.favorite :
                                     Icons.favorite_border, color: Colors.redAccent, size: 17,),
                                ),
                              ),
                            ) ,
                            )
                            , 
                            Positioned(
                            left: 5, 
                            bottom: 5,
                            child:  
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                                decoration: BoxDecoration(
                                  color: Colors.black87, 
                                  borderRadius: BorderRadius.circular(6)
                                ),
                                child: Center(
                                  child: Text(product.name, style: GoogleFonts.inter(
                                    fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white
                                  ),
                                  maxLines: 1, 
                                  overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                          
                            )
                            
                          ]  
                        );
                      },
                    ),
                  ),
               
                ],
               ),
             ),
           ),
      );
    
   }
  
  }