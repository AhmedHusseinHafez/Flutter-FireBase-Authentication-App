import 'package:flutter/material.dart';

showErroeMessage(
    {required BuildContext context, required String errorMessage}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Text(errorMessage),
    ),
  );
}
