import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:storeapp/utils/app_color.dart';
class CustomButton extends StatelessWidget {
  Function()? onTap;
  final String? buttonText;
  final Color? buttonColor;
  CustomButton({super.key , required this.onTap ,required this.buttonText , this.buttonColor});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(

          height: 56,
          width: double.infinity,
          decoration: BoxDecoration(
            color:buttonColor ?? AppColor.mainColor,
            borderRadius: BorderRadius.circular(12),

          ),
          child: Center(child: Text(buttonText! , style: TextStyle(color: Colors.white,
              fontSize: 20, fontWeight: FontWeight.bold),)
            ,),
        )

    );


  }
}
