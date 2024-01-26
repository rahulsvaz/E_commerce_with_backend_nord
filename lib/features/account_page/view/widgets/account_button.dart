 
import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final String label;
  final VoidCallback callBack;

  const AccountButton({
    super.key,
    required this.label,
    required this.callBack,
  });
  @override
  Widget build(BuildContext context) {
   // final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Expanded(
      child: Container(
        width: width * 0.4,
        margin: EdgeInsets.symmetric(horizontal: width * 0.02),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 0),
          borderRadius: BorderRadius.circular(50),
        ),
        child: OutlinedButton(
          onPressed: callBack,
          style: ElevatedButton.styleFrom(
            side: const BorderSide(color: Colors.white),
            backgroundColor: Colors.black12.withOpacity(0.03),
          ),
          child: Text(
            label,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
