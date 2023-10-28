import 'package:flutter/material.dart';

Widget logInSignInForgotButton(
    {required String label, required Function() onPressed}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.login),
      label: Text(label),
    ),
  );
}
