import 'package:flutter/material.dart';
import 'package:shopping_cart_with_node/common/global_variables/global_variables.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: GlobalVariables.categoryImages.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      GlobalVariables.categoryImages[index]['image']!),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  GlobalVariables.categoryImages[index]['title']!.toString(),
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
