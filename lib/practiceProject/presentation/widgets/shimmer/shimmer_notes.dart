import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerNotes extends StatelessWidget {
  const ShimmerNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.all(15),
        itemBuilder: (BuildContext context, int index) {
          return Shimmer.fromColors(
          baseColor: Colors.grey.shade300, 
          highlightColor: Colors.grey.shade100,
            child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300, 
              borderRadius: BorderRadius.circular(12)
            ),
          ),  
          );
        },
      ),
    );
  }
}