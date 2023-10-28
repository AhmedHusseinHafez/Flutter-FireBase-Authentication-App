import 'package:flutter/material.dart';
import 'package:third_party_sign_in/features/auth/presentation/widgets/login_signin_button.dart';
import 'package:third_party_sign_in/features/auth/presentation/widgets/text_field_widget.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final TextEditingController _forgotPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ForgotPassword"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _emailTextField(),
              const SizedBox(
                height: 12,
              ),
              logInSignInForgotButton(label: "Reset Password", onPressed: () {})
            ],
          ),
        ));
  }

  Widget _emailTextField() {
    return customTextField(controller: _forgotPassController, label: "Email");
  }
}
