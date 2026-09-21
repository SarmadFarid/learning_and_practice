import 'package:firebase/kairoApp/config/app_colors.dart';
import 'package:firebase/kairoApp/config/app_icons.dart';
import 'package:firebase/kairoApp/config/app_text_styles.dart';
import 'package:firebase/kairoApp/config/routes/app_routes.dart';
import 'package:firebase/kairoApp/mvc/controllers/home/home_controller.dart';
import 'package:firebase/kairoApp/utills/images/app_images.dart';
import 'package:firebase/kairoApp/widgets/reusable/circle_container.dart';
import 'package:firebase/kairoApp/widgets/reusable/emty_data.dart';
import 'package:firebase/kairoApp/widgets/reusable/hint_row.dart';
import 'package:firebase/kairoApp/widgets/screenSpecifix/home/toggle_switch_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.put(HomeController());
 
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
        backgroundColor: AppColors.background,
        title: Text(
          "kairosync",
          style: GoogleFonts.openSans(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            letterSpacing: -1.5,
          ),
        ).animate()
          .slideX(begin: -1, end: 0, curve: Curves.easeOut, duration: 400.ms)
          .fadeIn(duration: 300.ms),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.search); 
                },
                child: CircleContainer(icon: AppIcons.search, iconColor: AppColors.black)),
               SizedBox(width: 5),
          InkWell(
            onTap: () => showRankingBottomSheet(),
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CircleContainer(
                icon: AppIcons.swap,
                iconColor: AppColors.black,
              ),
            ),
          ),
            ],
          ).animate()
          .slideX(begin: -10, end: 0, curve: Curves.easeOut, duration: 800.ms)
          .fadeIn(duration: 400.ms),
          ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ToggleSwitchTab(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Obx(
            () =>
                 controller.selectedTab.value == 0 ?
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [EmtyData()],
                  )
                  :
               
                   Column(
                    children: [
                      SizedBox(height: 10),
                      //  new event text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("New Events", style: AppTextStyles.titleLarge),
                          Text("See all", style: AppTextStyles.seeAll),
                         ],
                         ),
                         SizedBox(height: 15),
                      //  card list
                      SizedBox(
                        height: 225,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          padding: const EdgeInsets.only(right: 5),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.78,
                              margin: EdgeInsets.only(left: index > 0 ? 10 : 1),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.black.withOpacity(0.08),
                                    blurRadius: 6,
                                    offset: Offset(1, 1),
                                  ),
                                ],
                              ),
                              child:
                              builEventCards(context) 
                            ).animate()
                         .slideX(begin: 1, end: 0, curve: Curves.easeOut, duration: 400.ms)
                         .fadeIn(duration: 400.ms, curve: Curves.easeIn);
                          },
                        ),
                      ),

                      // upcomming events
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Upcomming Events",
                            style: AppTextStyles.titleLarge,
                          ),
                          Text("See all", style: AppTextStyles.seeAll),
                        ],
                      ),
                      SizedBox(height: 10),
                      // emty data widget
                      EmtyData(),

                      SizedBox(height: 10),
                      // popular events
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Events",
                            style: AppTextStyles.titleLarge,
                          ),
                          Text("See all", style: AppTextStyles.seeAll),
                        ],
                      ),

                      //  cards grid
                      SizedBox(height: 15), 
                      builGridView()
                   ],
                  )
              
        ),
        ),
      ),
    );
  }
   

     Widget cardUsersList(BuildContext context) {
       return   SizedBox(
                    height: 30, 
                    width: 130, 
                                          child: Stack(
                                            children: [
                                              ...List.generate(
                                                 userImages.length > 4 ? 3 : userImages.length , 
                                                (index) {  
                                                  return  Positioned(
                                                    left: index * 23,
                                                  child:ClipRRect(
                                                   borderRadius:
                                                  BorderRadius.circular(50),
                                                 child: Image.asset(
                                                userImages[index],
                                                height: 30,
                                                width: 30,
                                                fit: BoxFit.cover,
                                              ),
                                             ), 
                                            ) ;
                                                   }) , 

                                         if(userImages.length > 4) 
                                         Positioned(
                                          left: 3 * 25, 
                                          bottom: 8,
                                          child: Text("+${userImages.length - 3}", 
                                          style: TextStyle(
                                            fontSize: 10, 
                                            color: AppColors.black, 
                                          ),), 
                                          )
                                            ],
                                          ),
                                        ); 
                           }

     Widget builEventCards(BuildContext context ) {
      return    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      // image
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                        ),
                                        child: Image.asset(
                                          AppImages.offerBanner,
                                          height: 120,
                                          width:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              1,
                                          fit: BoxFit.cover,
                                        ),
                                      ),

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
                                   ),
                                
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: 3,
                                      children: [
                                        Text(
                                          "Test1",
                                          style: AppTextStyles.titleMedium,
                                        ),

                                        HintRow(
                                          icon: AppIcons.accessTime,
                                          text: "2025 09-20, 20:21:00",
                                        ),

                                        HintRow(
                                          icon: AppIcons.location,
                                          text:
                                              "Azadlig avenu 15a/4 Baku Az, Baki, Azerbaijan",
                                        ),
                                       
                                       cardUsersList(context)
                                      ],
                                   ),
                                ),
                                ],
                            ); 
                          }

     Widget builGridView() {
                 return GridView.builder(
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
                                      blurRadius: 6,
                                      offset: Offset(1, 1),
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
                                            
                                       cardUsersList(context) 
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
                      ); 
                   
    }

     Widget rankingOption( String title) {
    return Obx( () =>
        InkWell(
        onTap: () {
          controller.selectedOption.value = title ;
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, ), 
          child: Row(
            children: [
               Radio<String>(
                value:title ,
                groupValue: controller.selectedOption.value,
                onChanged: (val) {
                  controller.selectedOption.value = val!; 
                },
                activeColor: AppColors.black,
              ), 
              SizedBox(width: 5,), 
              Text(
                title, 
                // style: AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.w400),
              ), 
            ],
          ), 
          ),
      ),
    ); 
  }

    void showRankingBottomSheet() {
    Get.bottomSheet(
      enterBottomSheetDuration: Duration(milliseconds: 300), 
      exitBottomSheetDuration: Duration(milliseconds: 300), 
      GetBuilder<HomeController>(
        builder: (_) =>  Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft:Radius.circular(22), 
          topRight:Radius.circular(22), 
        ), 
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08), 
            blurRadius: 10, 
            offset: Offset(0, -2), 
          )
        ]
      ),
      padding: EdgeInsets.symmetric( vertical: 25),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
           Center(
            child: Text("Ranking", style: AppTextStyles.titleLarge,), 
           ), 
           
            SizedBox(height: 20,), 

            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                width: Get.width, 
                height: 1, 
                decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.5), 
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
            ), 
           
           SizedBox(height: 5,), 
             
             Column(
              children: [
                rankingOption("Recommended"),
                rankingOption("The most recent date"),
                rankingOption("The most distant date"),
                rankingOption("The nearest location"),
                rankingOption("The farthest place"),
              ],
             ) , 
             SizedBox(height: 10,), 
          ],
        ),
        ) ,
      ), 
     ), 
      isScrollControlled: true, 
      backgroundColor: Colors.transparent
    ); 
      }

 
}
