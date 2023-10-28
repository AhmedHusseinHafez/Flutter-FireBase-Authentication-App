import 'package:flutter/material.dart';

Widget loginRegistNow(
    {required String message,
    required String buttonMessage,
    required Function() onPressed}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(message),
      TextButton(
        onPressed: onPressed,
        child: Text(buttonMessage),
      )
    ],
  );
}
