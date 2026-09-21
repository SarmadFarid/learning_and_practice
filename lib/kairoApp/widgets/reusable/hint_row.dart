import 'package:firebase/kairoApp/config/app_colors.dart';
import 'package:firebase/kairoApp/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class HintRow extends StatelessWidget {
  const HintRow({
    required this.icon, 
    required this.text, 
    super.key
    });

  final IconData icon ;
  final String text ;

  @override
  Widget build(BuildContext context) {
    return  Row(
              mainAxisAlignment: MainAxisAlignment.start,
               children: [
               Icon(icon, size: 15, color: AppColors.black,), 
                            SizedBox(width: 5,), 
                            Text(text, style: AppTextStyles.hint, overflow: TextOverflow.ellipsis,), 
                           ],
                          );
  }
}