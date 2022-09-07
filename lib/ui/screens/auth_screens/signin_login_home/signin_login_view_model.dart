import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thorium/core/models/appUser.dart';
import 'package:thorium/core/services/auth_service.dart';
import 'package:thorium/core/view_models/base_view_model.dart';
import 'package:thorium/ui/screens/home/home_screen.dart';

import '../../../../core/enums/view_state.dart';
import '../../../../core/models/custom_auth_result.dart';
import '../../../../core/services/database_service.dart';
import '../../../../locator.dart';
import '../../../custom_widgets/dialogs/error_dialog.dart';

class SigninLoginViewModel extends BaseViewModel {
  bool isSelected = false;
  AppUser appUser = AppUser();
  final _authService = locator<AuthService>();

  final _dbService = locator<DatabaseService>();
  final formKey = GlobalKey<FormState>();
  CustomAuthResult _authResult = CustomAuthResult();
  String? verifyPassword;

  bool isShow = false;
  // final _authService = locator<AuthService>();

  selectTab(bool val) {
    isSelected = val;
    notifyListeners();
  }

  isShowPass() {
    isShow = !isShow;
    notifyListeners();
  }

  ///
  ///register functoin
  ///
  ///

  void signUpWithEmailAndPassword() async {
    debugPrint('@ViewModel/signup');
    appUser.creatAt = DateTime.now();
    setState(ViewState.busy);

    _authResult = await _authService.signUpWithEmailPassword(appUser);
    if (_authResult.status!) {
      debugPrint("User created successfully");

      final newToken = await FirebaseMessaging.instance.getToken();
      _authService.appUser.fcmToken = newToken;
      await _dbService.updateFcm(newToken, _authResult.user!.uid);
      Get.off(() => HomeScreen());
    } else {
      Get.dialog(ErrorDialog(errorMessage: _authResult.errorMessage));
    }
    setState(ViewState.idle);
  }

  ///
  ///sign in
  ///

  void loginWithEmailAndPassword() async {
    setState(ViewState.busy);
    _authResult = await _authService.loginWithEmailPassword(
        email: appUser.email, password: appUser.password);
    if (_authResult.status!) {
      debugPrint("User logged in successfully");
      final newToken = await FirebaseMessaging.instance.getToken();
      _authService.appUser.fcmToken = newToken;
      await _dbService.updateFcm(newToken, _authResult.user!.uid);
      Get.offAll(() => HomeScreen());
    } else {
      Get.dialog(ErrorDialog(errorMessage: _authResult.errorMessage));
    }
    setState(ViewState.idle);
  }
}
