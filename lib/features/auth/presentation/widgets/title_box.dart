import 'package:flutter/material.dart';

import '../../../../core/app_theme.dart';

Widget titleBox({required Function() onTap, required String image}) {
  return InkWell(
    onTap: onTap,
    child: Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shadowColor: primaryColor,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SizedBox(
        width: 70,
        height: 70,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}


