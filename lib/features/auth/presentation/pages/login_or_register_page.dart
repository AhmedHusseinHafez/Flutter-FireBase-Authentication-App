import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:third_party_sign_in/features/auth/presentation/pages/login_page.dart';
import 'package:third_party_sign_in/features/auth/presentation/pages/register_page.dart';

import '../bloc/toggles/toggle_pages_bloc/bloc/toggle_pages_bloc.dart';

class LogInOrRegisterPage extends StatelessWidget {
  const LogInOrRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TogglePagesBloc, TogglePagesState>(
      builder: (context, state) {
        if (state.showLoginPage) {
          return LogInPage(
            onPressed: () {
              context.read<TogglePagesBloc>().add(TogglePagesClickEvent());
            },buttonName: "Sign In",
          );
        } else {
          return RegisterPage(
            onPressed: () {
              context.read<TogglePagesBloc>().add(TogglePagesClickEvent());
            },buttonName: "Sign Up",
          );
        }
      },
    );
  }
}
