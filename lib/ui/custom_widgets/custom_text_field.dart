import 'package:flutter/material.dart';
import 'package:thorium/core/constant/colors.dart';
import 'package:thorium/core/constant/strings.dart';
import 'package:thorium/core/constant/style.dart';

class CustomTextField extends StatelessWidget {
  final onChanged;
  final validate;
  final isShow;
  final String? text;
  final String? iconPath;
  double? iconHieght;
  double? iconWidth;
  bool? obscureText;

  CustomTextField(
      {this.text,
      this.isShow,
      this.onChanged,
      this.obscureText = false,
      this.iconPath,
      this.validate,
      this.iconHieght,
      this.iconWidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: const Color(0xffBFDDEC))),
            child: TextFormField(
              onChanged: onChanged,
              validator: validate,
              cursorColor: whiteColor,
              style: buttonTextStyle,
              obscureText: obscureText!,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 9),
                  border: InputBorder.none,
                  hintText: text,
                  hintStyle: buttonTextStyle,
                  prefixIcon: GestureDetector(
                    onTap: isShow,
                    child: UnconstrainedBox(
                        child: Image.asset(
                      '$staticAsset/$iconPath',
                      height: iconHieght,
                      width: iconWidth,
                    )),
                  )),
            )),
        const SizedBox(height: 14)
      ],
    );
  }
}
