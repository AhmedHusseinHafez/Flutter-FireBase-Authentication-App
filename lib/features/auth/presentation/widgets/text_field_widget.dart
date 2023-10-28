import 'package:flutter/material.dart';

TextFormField customTextFormField(
    {required TextEditingController controller,
    required String lable,
    required GlobalKey<FormState> formKey,
    required String validatorTextMassage,
    required TextInputType type,
    required bool obscureText,
    Widget? suffixIcon}) {
  return TextFormField(
    keyboardType: type,
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
        label: Text(lable), filled: true, suffixIcon: suffixIcon),
    onChanged: (val) {
      formKey.currentState!.validate();
    },
    validator: (value) {
      if (value == null || value.isEmpty) {
        return validatorTextMassage;
      }
      return null;
    },
  );
}

TextField customTextField(
    {required TextEditingController controller, required String label}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      label: Text(label),
      filled: true,
    ),
  );
}
