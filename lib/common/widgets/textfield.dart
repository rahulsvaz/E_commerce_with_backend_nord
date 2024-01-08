import 'package:flutter/material.dart';
class AppTextField extends StatelessWidget{
  final String hintText;
 final TextEditingController  controller;
    const AppTextField({super.key,required this.controller, required this.hintText});
  @override
  Widget build(BuildContext context){

    return TextFormField(

      controller: controller,
      validator: (value){},
      decoration:  InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38)
        )
      ),
    );
  }
}