import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String imageUrl;

  const SingleProduct({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12)
      ),
      margin: EdgeInsets.all(5),
      child: Image.network(imageUrl),
    );
  }
}