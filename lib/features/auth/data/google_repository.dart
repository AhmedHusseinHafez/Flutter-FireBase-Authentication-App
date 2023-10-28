//sign in method
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:third_party_sign_in/core/util/navigator_push.dart';
import '../presentation/pages/successfull_login_page.dart';

//sign In method


//forgot Password method
Future signInWithGoogle({required BuildContext context}) async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  if (googleUser == null) {
    return;
  }

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth =
      // ignore: unnecessary_null_aware
      await googleUser.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  await FirebaseAuth.instance.signInWithCredential(credential);
  if (context.mounted) {
    pageView(context: context, widget: SuccessFullLogin());
  }
}

//signout from google
void signOutFromGoogle({required BuildContext context}) async {
  GoogleSignIn googleSignIn = GoogleSignIn();
  googleSignIn.disconnect();
  await FirebaseAuth.instance.signOut();
  if (context.mounted) {
    Navigator.of(context).pop();
  }
}
