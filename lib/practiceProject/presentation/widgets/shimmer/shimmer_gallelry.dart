import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGallelry extends StatelessWidget {
  const ShimmerGallelry({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20, 
          crossAxisSpacing: 20, 
          childAspectRatio: 0.8, 
         ),
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return  Shimmer.fromColors(
            baseColor: Colors.grey.shade300 , 
            highlightColor: Colors.grey.shade100 , 
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300, 
                borderRadius: BorderRadius.circular(10)
              ),
            ), 
            );
        },
      ),
    );
  }
}