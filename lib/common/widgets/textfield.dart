import 'package:flutter/material.dart';
class AppTextField extends StatelessWidget{
final String? Function(String?)? validator;
  final String hintText;
 final TextEditingController  controller;
    const AppTextField({super.key,required this.controller, required this.hintText,required this.validator});
  @override
  Widget build(BuildContext context){

    return TextFormField(

      controller: controller,
      validator:validator,
      decoration:  InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38)
        )
      ),
    );
  }
}