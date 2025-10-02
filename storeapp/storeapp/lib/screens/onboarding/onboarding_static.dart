import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class OnboardingStatic extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final Widget ? background;

  const OnboardingStatic({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 300,
          ),
          const SizedBox(height: 48),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColor.mainColor
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}