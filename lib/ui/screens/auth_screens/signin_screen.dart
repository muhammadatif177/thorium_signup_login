import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:thorium/core/constant/colors.dart';
import 'package:thorium/core/constant/strings.dart';
import 'package:thorium/core/constant/style.dart';
import 'package:thorium/ui/custom_widgets/custom_text_field.dart';
import 'package:thorium/ui/screens/auth_screens/signin_login_home/signin_login_view_model.dart';
import 'package:thorium/ui/screens/home/home_screen.dart';

class SignInScreen extends StatelessWidget {
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<SigninLoginViewModel>(
      builder: (context, model, child) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                text: "Email",
                iconPath: "email-icon.png",
                iconHieght: 16,
                iconWidth: 20,
                onChanged: (val) {
                  model.appUser.email = val;
                },
                validate: (val) {
                  if (val.isEmpty) {
                    return "Enter Email";
                  }
                  bool isEmail(String em) {
                    String p =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                    RegExp regExp = new RegExp(p);

                    return regExp.hasMatch(em);
                  }

                  if (isEmail == false) {
                    return "in-valid-email";
                  }
                },
              ),

              CustomTextField(
                text: "Password",
                iconPath: "lock-icon.png",
                isShow: () {
                  model.isShowPass();
                },
                obscureText: model.isShow == true ? false : true,
                iconHieght: 20,
                iconWidth: 14,
                onChanged: (val) {
                  model.appUser.password = val;
                },
                validate: (val) {
                  if (val.isEmpty) {
                    return 'Please Enter Password';
                  }
                  if (val.length < 6) {
                    return "Password should be greater then 6";
                  }
                },
              ),

              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Forgot your password?",
                  style: TextStyle(
                      letterSpacing: .5,
                      color: whiteColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      fontFamily: 'oswald',
                      decoration: TextDecoration.underline),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: buttonColor,
                      // const Color(0xffBFDDEC),
                      height: 1,
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    "or",
                    style: TextStyle(
                        color: whiteColor,
                        fontFamily: 'oswald',
                        fontSize: 12,
                        fontWeight: FontWeight.w200),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: buttonColor,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 14),

              ///
              ///social buttons
              ///
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: const Color(0xff535566),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Image.asset(
                        "$staticAsset/ios-logo.png",
                        height: 23.5,
                        width: 20,
                      )),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          color: const Color(0xff3B5998),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Image.asset(
                        "$staticAsset/fb-logo.png",
                        height: 20,
                        width: 9,
                      )),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          color: const Color(0xff4385F4),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Image.asset(
                        "$staticAsset/twitter-logo.png",
                        height: 18.56,
                        width: 22.84,
                      )),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    model.loginWithEmailAndPassword();
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                      color: submitButtonColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                      child: Text(
                    'Sign In',
                    style: buttonTextStyle.copyWith(
                        letterSpacing: .5,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  )),
                ),
              ),
              const SizedBox(height: 14),

              GestureDetector(
                onTap: () async {
                  final isAuthenticated = await model.authenticate();
                  if (isAuthenticated) {
                    model.appUser.email = model.localStorageService.getEmail;
                    model.appUser.password =
                        model.localStorageService.getPassword;
                    model.loginWithEmailAndPassword();
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                      color: submitButtonColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                      child: Text(
                    'Use finger for sign in',
                    style: buttonTextStyle.copyWith(
                        letterSpacing: .5,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  )),
                ),
              ),
              const SizedBox(height: 14),
            ],
          ),
        );
      },
    );
  }
}
