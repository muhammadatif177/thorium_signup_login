import 'package:flutter/material.dart';
import 'package:thorium/core/services/local_storage_service.dart';
import 'package:thorium/ui/screens/home/home_screen.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/strings.dart';
import '../../core/services/auth_service.dart';
import '../../locator.dart';
import 'auth_screens/signin_login_home/signin_login_home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authService = locator<AuthService>();
  final _localStorageService = locator<LocalStorageService>();

  ///
  /// splash screen Time
  ///
  navigateToNextScreen() async {
    await _authService.init();
    await _localStorageService.init();
    // / check if user is already logged in?
    if (_authService.isLogin == true) {
      if (_authService.appUser.id != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false);
      } else {
        navigateToNextScreen();
      }
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SignupLoginHome()),
          (route) => false);
    }
  }

  @override
  void initState() {
    navigateToNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                colors: [primaryColor, Color(0xff167CB4), Color(0xff0B60A2)])),
        child: const Center(
            child: CircularProgressIndicator(
          color: whiteColor,
        )),
      ),
    );
  }
}
