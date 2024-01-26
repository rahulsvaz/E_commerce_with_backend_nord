
import 'package:flutter/material.dart';

class SizedBox10 extends StatelessWidget {
  const SizedBox10({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height*0.01,
    );
  }
}