import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:storeapp/screens/Auth/login_sreen.dart';
import 'package:storeapp/screens/onboarding/onboarding_static.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);
  static String id = 'onbording screen';

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final PageController _pageController = PageController();

  bool _isLastPage = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );

                },
                child:  Text(
                  "Skip",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),

            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {

                  setState(() {
                    _isLastPage = index == 1;
                  });
                },
                children: const [
                  OnboardingStatic(
                    imagePath: 'assets/Images/Vetrina Live – Ecommerce platform made easy for everyone.jpeg',
                    title: 'Welcome to My Store.',
                    description: 'I provide essential electronic devices y!',
                  ),
                  OnboardingStatic(
                    imagePath: 'assets/Images/login.jpeg',

                    title: 'Design Template uploads Every Tuesday!',
                    description: 'Make sure to take a look my uplab profile every tuesday',
                  ),

                ],
              ),
            ),

            _buildBottomControls(),
          ],
        ),
      ),
    );
  }


  Widget _buildBottomControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          SmoothPageIndicator(
            controller: _pageController,
            count: 2,
            effect: const WormEffect(
              dotColor: Colors.black26,
              activeDotColor: Colors.black87,
              dotHeight: 10,
              dotWidth: 10,
            ),
          ),

          TextButton(
            onPressed: () {
              if (_isLastPage) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              } else {

                _pageController.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Text(
              _isLastPage ? "Done" : "Next",
              style:  TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}