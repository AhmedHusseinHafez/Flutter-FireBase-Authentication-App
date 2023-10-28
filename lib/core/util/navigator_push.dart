import 'package:flutter/material.dart';

pageView({required BuildContext context, required Widget widget}) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => widget));
}
