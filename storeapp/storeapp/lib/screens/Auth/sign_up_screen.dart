import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/screens/Auth/login_sreen.dart';

import '../../helper/notifications.dart';
import '../../utils/app_color.dart';
import '../../utils/app_validator.dart';
import '../../utils/app_word.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../mainscreen/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _emaileController = TextEditingController();
    final  _nameController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmpasswordController = TextEditingController();

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
                SizedBox(height: 80,),
                const Text(
                  Appword.signup,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 30,
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
                      Text(Appword.name ,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: AppColor.mainColor , fontWeight: FontWeight.bold),),
                      SizedBox(height: 7,),
                      CustomTextField(
                        controller: _nameController,
                        prefixIcon: Icons.person,
                        hintText: Appword.name,
                        keyBoardType: TextInputType.emailAddress,
                        validator: (input) {
                          return AppValidator.validate(
                            input: input!,
                            type: ValidationType.username,
                          );
                        },
                      ),
                      SizedBox(height: 20),//name
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
                      SizedBox(height: 20),//email
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
                      SizedBox(height: 20),//password
                      Text(Appword.confirmPassword ,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: AppColor.mainColor , fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      CustomTextField(
                        hideInput: true,
                        prefixIcon: Icons.lock_outline,
                        controller: _confirmpasswordController,
                        hintText: Appword.confirmPassword,
                        keyBoardType: TextInputType.visiblePassword,
                        validator: (value) {
                          return AppValidator.validate(
                              input: value!,
                              type: ValidationType.confirmpassword,
                              otherValue: _passwordController.text
                          );
                        },
                      ),
                      SizedBox(height: 20),//confirmpassword
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
                          buttonText: Appword.signup,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          Appword.orlogin,
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
                              builder: (context) => LoginScreen(),
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
