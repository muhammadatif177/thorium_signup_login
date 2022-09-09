import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thorium/ui/custom_widgets/custom_text_field.dart';
import 'package:thorium/ui/screens/auth_screens/signin_login_home/signin_login_view_model.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/style.dart';

class RegisterScreen extends StatelessWidget {
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
                  text: "Name",
                  iconPath: "person-icon.png",
                  iconHieght: 20,
                  iconWidth: 20,
                  onChanged: (val) {
                    model.appUser.name = val;
                  },
                  validate: (val) {
                    if (val.isEmpty) {
                      return "Enter Name";
                    }
                  }),
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
                isShow: () {
                  model.isShowPass();
                },
                text: "Password",
                iconPath: "lock-icon.png",
                iconHieght: 20,
                iconWidth: 14,
                obscureText: model.isShow == true ? false : true,
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
              CustomTextField(
                isShow: () {
                  model.isShowPass();
                },
                text: "Password Verify",
                iconPath: "lock-icon.png",
                iconHieght: 20,
                iconWidth: 14,
                obscureText: model.isShow == true ? false : true,
                onChanged: (val) {
                  model.verifyPassword = val;
                },
                validate: (val) {
                  if (val.isEmpty) {
                    return "Verify Your Password";
                  } else if (val != model.appUser.password) {
                    return "Verify Your Password";
                  }
                },
              ),
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    model.signUpWithEmailAndPassword();
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                      color: submitButtonColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                      child: Text(
                    'Create Account',
                    style: buttonTextStyle.copyWith(
                        letterSpacing: .5,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  )),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }
}
