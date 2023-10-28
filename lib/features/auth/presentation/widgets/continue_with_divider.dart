import 'package:flutter/material.dart';

Widget orContinueWithRow() {
  return const Row(
    children: [
      Expanded(flex: 1, child: SizedBox(child: Divider())),
      Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text("Or continue with"),
        ),
      ),
      Expanded(flex: 1, child: SizedBox(child: Divider())),
    ],
  );
}
