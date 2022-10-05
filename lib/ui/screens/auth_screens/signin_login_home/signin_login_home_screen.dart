import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:thorium/core/constant/colors.dart';
import 'package:thorium/core/constant/strings.dart';
import 'package:thorium/core/constant/style.dart';
import 'package:thorium/core/enums/view_state.dart';
import 'package:thorium/ui/screens/auth_screens/signin_login_home/signin_login_view_model.dart';

import '../register_screen.dart';
import '../signin_screen.dart';

class SignupLoginHome extends StatelessWidget {
  SignupLoginHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SigninLoginViewModel(),
        child: Consumer<SigninLoginViewModel>(
          builder: (context, model, child) {
            return ModalProgressHUD(
              inAsyncCall: model.state == ViewState.busy,
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            '$staticAsset/Background-image.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              primaryColor,
                              Color(0xff167CB4),
                              Color(0xff0B60A2)
                            ])),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 62,
                              ),
                              Image.asset(
                                '$staticAsset/arrow.back-icon.png',
                                height: 24,
                                width: 24,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 108),
                                child: Image.asset(
                                  '$staticAsset/logo.png',
                                  height: 200,
                                  width: 160,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),

                              ///
                              ///toggle button
                              ///
                              Container(
                                padding: const EdgeInsets.all(2),
                                height: 32,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: buttonColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            model.selectTab(false);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: model.isSelected == false
                                                    ? const Color(0xff95CDE3)
                                                    : buttonColor,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Center(
                                                child: Text(
                                              "Sign In",
                                              style: model.isSelected == false
                                                  ? selectedTextStyle
                                                  : unSelectedTextStyle,
                                            )),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 1),
                                      Container(
                                          width: 1,
                                          color: const Color(0xff95CDE3)),
                                      const SizedBox(width: 1),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            model.selectTab(true);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: model.isSelected == true
                                                    ? const Color(0xff95CDE3)
                                                    : buttonColor,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Center(
                                                child: Text(
                                              "Register",
                                              style: model.isSelected == true
                                                  ? selectedTextStyle
                                                  : unSelectedTextStyle,
                                            )),
                                          ),
                                        ),
                                      )
                                    ]),
                              ),
                              const SizedBox(height: 14),
                              ////
                              ///
                              ///
                              model.isSelected == false
                                  ? SignInScreen()
                                  : RegisterScreen(),

                              ///
                              ///
                              ///
                              ///
                              ///
                              // const SizedBox(height: 14),
                              // model.isSelected == false
                              //     ? GestureDetector(
                              //         onTap: () {
                              //           print('i am press');
                              //           if (_formKey.currentState!.validate()) {
                              //             model.loginWithEmailAndPassword();
                              //           }
                              //         },
                              //         child: Container(
                              //           padding: const EdgeInsets.symmetric(
                              //               vertical: 14),
                              //           decoration: BoxDecoration(
                              //               color: submitButtonColor,
                              //               borderRadius:
                              //                   BorderRadius.circular(8)),
                              //           child: Center(
                              //               child: Text(
                              //             'Sign In',
                              //             style: buttonTextStyle.copyWith(
                              //                 letterSpacing: .5,
                              //                 fontSize: 16,
                              //                 fontWeight: FontWeight.w700),
                              //           )),
                              //         ),
                              //       )
                              //     : GestureDetector(
                              //         onTap: () {
                              //           if (_formKey.currentState!.validate()) {
                              //             model.signUpWithEmailAndPassword();
                              //           }
                              //         },
                              //         child: Container(
                              //           padding: const EdgeInsets.symmetric(
                              //               vertical: 14),
                              //           decoration: BoxDecoration(
                              //               color: submitButtonColor,
                              //               borderRadius:
                              //                   BorderRadius.circular(8)),
                              //           child: Center(
                              //               child: Text(
                              //             'Create Account',
                              //             style: buttonTextStyle.copyWith(
                              //                 letterSpacing: .5,
                              //                 fontSize: 16,
                              //                 fontWeight: FontWeight.w700),
                              //           )),
                              //         ),
                              //       )
                            ]),
                      ),
                    ]),
                  ),
                ),
              ),
            );
          },
        ));
  }
}

// Container(
//                   decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage(
//                           '$staticAsset/Background-image.png',
//                         ),
//                         fit: BoxFit.cover,
//                       ),
//                       gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             primaryColor,
//                             Color(0xff167CB4),
//                             Color(0xff0B60A2)
//                           ])),
//                   child: Image.asset(
//                     '$staticAsset/Background-image.png',
//                     height: double.infinity,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),

//                 //////////
//                 ///
//                 ///
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(
//                           height: 62,
//                         ),
//                         Image.asset(
//                           '$staticAsset/arrow.back-icon.png',
//                           height: 24,
//                           width: 24,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 108),
//                           child: Image.asset(
//                             '$staticAsset/logo.png',
//                             height: 200,
//                             width: 160,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 30,
//                         ),

//                         ///
//                         ///toggle button
//                         ///
//                         Container(
//                           padding: const EdgeInsets.all(2),
//                           height: 32,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               color: buttonColor,
//                               borderRadius: BorderRadius.circular(8)),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       model.selectTab(false);
//                                     },
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                           color: model.isSelected == false
//                                               ? const Color(0xff95CDE3)
//                                               : buttonColor,
//                                           borderRadius:
//                                               BorderRadius.circular(6)),
//                                       child: Center(
//                                           child: Text(
//                                         "Sign In",
//                                         style: model.isSelected == false
//                                             ? selectedTextStyle
//                                             : unSelectedTextStyle,
//                                       )),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 1),
//                                 Container(
//                                     width: 1, color: const Color(0xff95CDE3)),
//                                 const SizedBox(width: 1),
//                                 Expanded(
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       model.selectTab(true);
//                                     },
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                           color: model.isSelected == true
//                                               ? const Color(0xff95CDE3)
//                                               : buttonColor,
//                                           borderRadius:
//                                               BorderRadius.circular(6)),
//                                       child: Center(
//                                           child: Text(
//                                         "Register",
//                                         style: model.isSelected == true
//                                             ? selectedTextStyle
//                                             : unSelectedTextStyle,
//                                       )),
//                                     ),
//                                   ),
//                                 )
//                               ]),
//                         ),
//                         const SizedBox(height: 14),
//                         ////
//                         ///
//                         ///
//                         model.isSelected == false
//                             ? SignInScreen()
//                             : RegisterScreen()
//                       ]),
//                 )
