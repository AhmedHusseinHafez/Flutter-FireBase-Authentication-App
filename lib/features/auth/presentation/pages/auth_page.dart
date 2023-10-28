import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:third_party_sign_in/features/auth/presentation/pages/login_or_register_page.dart';
import 'package:third_party_sign_in/features/auth/presentation/pages/successfull_login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //is user logged in
          if (snapshot.hasData && snapshot.data != null) {
            return SuccessFullLogin();

            //is user not logged in
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const LogInOrRegisterPage();
          }
        },
      ),
    );
  }
}
