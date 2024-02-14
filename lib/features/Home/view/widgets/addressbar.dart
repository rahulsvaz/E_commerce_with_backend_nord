import 'package:flutter/material.dart';

class AddressBar extends StatelessWidget {
  const AddressBar({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height*0.05,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 114, 226, 221),
            Color.fromARGB(255, 162, 226, 221),
          ],
        ),
      ),
    );
  }
}
