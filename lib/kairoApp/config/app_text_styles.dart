import 'package:firebase/kairoApp/config/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle titleLarge = GoogleFonts.inter(
     fontSize: 18, fontWeight: FontWeight.w600
  ) ;
 
 static TextStyle titleMedium = GoogleFonts.inter(
    fontSize: 14, fontWeight: FontWeight.w600
  ) ;
  
  static TextStyle seeAll = GoogleFonts.inter(
    fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.grey
  ) ;

  static TextStyle hint = GoogleFonts.inter(
    fontSize: 10, fontWeight: FontWeight.w500, color: AppColors.grey
  ) ;
  

}