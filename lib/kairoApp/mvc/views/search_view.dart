import 'package:firebase/kairoApp/config/app_colors.dart';
import 'package:firebase/kairoApp/config/app_icons.dart';
import 'package:firebase/kairoApp/config/app_text_styles.dart';
import 'package:firebase/kairoApp/utills/images/app_images.dart';
import 'package:firebase/kairoApp/widgets/reusable/circle_container.dart';
import 'package:firebase/kairoApp/widgets/reusable/hint_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController serchController = TextEditingController(); 
  final List<String> userImages = [
    AppImages.profile,
    AppImages.profile,
    AppImages.profile,
    AppImages.profile,
    AppImages.profile,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text("Search Events", 
        style: GoogleFonts.inter(
          fontSize: 20, 
          fontWeight: FontWeight.w600 
        ),
        ),
        leadingWidth:50,
        leading: InkWell(
          onTap: () => Get.back(),
          child: CircleContainer(
            margin: EdgeInsets.only(left: 15), iconSize: 15,
           bgColor: AppColors.black.withOpacity(0.1),
            icon: Icons.arrow_back_ios_new, iconColor: AppColors.black,),
        ),
        
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70), 
        child: Container(
          height:70, 
          color:AppColors.background,
          child: 
         Container(
       margin: const EdgeInsets.only(right:12, left: 12, top: 15, bottom: 5),
       decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
     color: AppColors.white,
     border: Border.all(color: AppColors.grey.withOpacity(0.35), width: 1),
    boxShadow: [
      BoxShadow(
        color: AppColors.black.withOpacity(0.08),
        // blurRadius: 3,
        // offset: const Offset(0, 2),
      ),
    ],
  ),
  child: TextField(
    cursorHeight: 20,
    textAlignVertical: TextAlignVertical.center, // 👈 centers vertically
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      border: InputBorder.none,
      hintText: "Search",
      hintStyle: GoogleFonts.inter(
        fontSize: 15,
        color: AppColors.grey.withOpacity(0.8),
        fontWeight: FontWeight.w500,
      ),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 12, right: 6), // 👈 space adjust
        child: Icon(
          AppIcons.search,
          size: 22,
          color: AppColors.black.withOpacity(0.8),
        ),
      ),
      prefixIconConstraints: const BoxConstraints(
        minWidth: 30,
        minHeight: 30,
      ),
    ),
  ),
)

          
        )
        ),
      ),
    
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 15, vertical: 10),
         child:      GridView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 15,
                              childAspectRatio: 2.7,
                            ),
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black.withOpacity(0.08),
                                      blurRadius: 2,
                                      offset: Offset(0.5, 1),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // image
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        "assets/product.png",
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: 5,
                                      children: [
                                        Text(
                                          "Apple WWDC",
                                          style: AppTextStyles.titleMedium,
                                        ),

                                        HintRow(
                                          icon: AppIcons.location,
                                          text: "Sahiwal",
                                        ),

                                        HintRow(
                                          icon: AppIcons.accessTime,
                                          text: "2025 09-20, 20:21:00",
                                        ),

                                        SizedBox(
                                          height: 30,
                                          width: 130,
                                          child: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              // first 3 images show
                                              ...List.generate(
                                                userImages.length > 4
                                                    ? 3
                                                    : userImages.length,
                                                (index) {
                                                  return Positioned(
                                                    left: index * 23,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            50,
                                                          ),
                                                      child: Image.asset(
                                                        userImages[index],
                                                        height: 30,
                                                        width: 30,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),

                                              // "+x" circle if more than 4 images
                                              if (userImages.length > 4)
                                                Positioned(
                                                  bottom: 8,
                                                  left: 3 * 25,
                                                  child: Text(
                                                    "+${userImages.length - 3}",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ).animate()
                              .fadeIn(duration: 500.ms, curve: Curves.easeIn)
                              .slideY( begin: 0.1, end: 0 , curve: Curves.easeOut)
                              ,

                              Positioned(
                                right: 5,
                                top: 5,
                                child: CircleContainer(
                                  icon: AppIcons.favouriteBorder,
                                  iconColor: AppColors.grey,
                                  bgColor: AppColors.white,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                 
         ),
    );
  }
}