import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thorium/core/constant/colors.dart';
import 'package:thorium/core/constant/strings.dart';
import 'package:thorium/core/constant/style.dart';
import 'package:thorium/core/services/auth_service.dart';
import 'package:thorium/ui/screens/auth_screens/signin_login_home/signin_login_home_screen.dart';

import '../../../locator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authService = locator<AuthService>();
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
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "HOME SCREEN",
              style: buttonTextStyle.copyWith(fontSize: 40),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                await _authService.logout(id: _authService.appUser.id);
                Get.offAll(SignupLoginHome());
              },
              child: Text(
                "Log Out",
                style: buttonTextStyle.copyWith(fontSize: 20),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
