import 'package:flutter/material.dart';
import 'package:thorium/core/constant/style.dart';

import '../../../core/constant/colors.dart';

class ErrorDialog extends StatelessWidget {
  final String? errorMessage;

  // ignore: use_key_in_widget_constructors
  const ErrorDialog({@required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Error', style: dialogStyle),
      content: Text("$errorMessage"),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(primaryColor)),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Ok',
            style: dialogStyle,
          ),
        ),
      ],
    );
  }
}
