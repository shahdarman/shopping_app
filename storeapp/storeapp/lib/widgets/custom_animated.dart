import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import '../utils/app_color.dart';

class CustomAnimated extends AnimatedWidget {
  CustomAnimated({Key? key, required Animation<double> animation, required  child})
    : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Transform.scale(
      scale: animation.value,
      child: Opacity(
        opacity: animation.value,
        child:CircleAvatar(
          radius: 45,
          backgroundColor: AppColor.mainColor.withOpacity(0.3),
          child: Icon(
            Icons.person,
            size: 30,
            color: AppColor.mainColor,
          ),
        ),
      ),
    );
  }
}
