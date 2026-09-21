import 'package:firebase/kairoApp/config/app_colors.dart';
import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
   final IconData icon ;
   final Color? iconColor; 
   final double? iconSize; 
    final Color? bgColor; 
    final double? width ;
    final double? height ;
    final EdgeInsetsGeometry? margin ;
  const  CircleContainer({
    super.key, 
    required this.icon, 
    this.iconColor, 
    this.bgColor, 
    this.height, 
    this.width, 
    this.margin, 
    this.iconSize
    });
   

  @override
  Widget build(BuildContext context) {
    return  Container(
            margin: margin ?? EdgeInsets.all(0),
            width: width ?? 32, 
            height: height ?? 32,
            decoration: BoxDecoration(
              color: bgColor ?? AppColors.grey.withOpacity(0.14), 
              shape: BoxShape.circle
            ),
            child: Center(
              child: Icon(
                 icon, 
                color: iconColor ?? AppColors.black, 
                size: iconSize ?? 20,)),
          );
  }
}