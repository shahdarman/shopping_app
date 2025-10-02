import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/screens/mainscreen/home_screen.dart';
import 'package:storeapp/screens/onboarding/onboarding_screen.dart';

void main()async  {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'lang',
      // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      routes: {OnboardingScreen.id: (context) => OnboardingScreen()},
      initialRoute: OnboardingScreen.id,
    );
  }
}
