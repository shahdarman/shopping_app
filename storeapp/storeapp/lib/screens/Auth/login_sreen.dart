import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:storeapp/screens/Auth/sign_up_screen.dart';
import 'package:storeapp/screens/mainscreen/home_screen.dart';

import '../../helper/notifications.dart';
import '../../utils/app_color.dart';
import '../../utils/app_images.dart';

import '../../utils/app_validator.dart';
import '../../utils/app_word.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _emaileController = TextEditingController();
    final _passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 100,),
                 const Text(
                  Appword.signin,
                   textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 14,),
                const Text( Appword.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.greyColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 70,),
                      Text(Appword.email ,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: AppColor.mainColor , fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      CustomTextField(
                        controller: _emaileController,
                        prefixIcon: Icons.email,
                        hintText: Appword.email,
                        keyBoardType: TextInputType.emailAddress,
                        validator: (input) {
                          return AppValidator.validate(
                            input: input!,
                            type: ValidationType.username,
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      Text(Appword.password ,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: AppColor.mainColor , fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      CustomTextField(
                        hideInput: true,
                        prefixIcon: Icons.lock_outline,
                        controller: _passwordController,
                        hintText: Appword.password,
                        keyBoardType: TextInputType.visiblePassword,
                        validator: (input) {
                          return AppValidator.validate(
                            input: input!,
                            type: ValidationType.password,
                          );
                        },
                      ),
                      SizedBox(height: 10,),
                      Text(Appword.forgetpassword ,
                        textAlign: TextAlign.right,
                        style: TextStyle(color: AppColor.mainColor , fontWeight: FontWeight.bold),),
                      SizedBox(height: 20),
                      Card(
                        elevation: 10,
                        child: CustomButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              NotificationService.showSuccessNotification(
                                context,
                               Appword.ylogin,Appword.success
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            }else{
                              NotificationService.showErrorNotification(
                                context,
                                Appword.flogin,
                                Appword.failed,
                              );
                            }
                          },
                          buttonText: Appword.login,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          Appword.orsignup,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColor.mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
