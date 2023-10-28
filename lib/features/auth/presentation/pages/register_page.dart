import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:third_party_sign_in/features/auth/data/google_repository.dart';
import 'package:third_party_sign_in/features/auth/presentation/widgets/login_regist_now.dart';
import 'package:third_party_sign_in/features/auth/presentation/widgets/login_signin_button.dart';
import '../bloc/toggles/password_visiblity_bloc/passwordvisiblity_bloc.dart';
import '../widgets/continue_with_divider.dart';
import '../widgets/text_field_widget.dart';
import '../widgets/title_box.dart';

class RegisterPage extends StatelessWidget {
  final Function()? onPressed;
  RegisterPage({Key? key, required this.onPressed, required this.buttonName})
      : super(key: key);
  final String buttonName;
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _emailTextField(),
                      const SizedBox(
                        height: 12,
                      ),
                      _passwordTextField(
                        controller: _passwordController,
                        lable: "Password",
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      _passwordTextField(
                        controller: _confirmPasswordController,
                        lable: "Confirm Password",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                _signInButton(),
                const SizedBox(
                  height: 10,
                ),
                orContinueWithRow(),
                const SizedBox(
                  height: 10,
                ),
                _thirdParty(context: context),
                const SizedBox(
                  height: 10,
                ),
                _haveAccountrRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: const Text('Sign Up'),
    );
  }

  Widget _emailTextField() {
    return customTextFormField(
      obscureText: false,
      type: TextInputType.emailAddress,
      controller: _emailController,
      lable: "Email",
      formKey: _formKey,
      validatorTextMassage: "Please Enter Email",
    );
  }

  Widget _passwordTextField({
    required TextEditingController controller,
    required String lable,
  }) {
    return BlocBuilder<PasswordvisiblityBloc, PasswordVisiblityState>(
      builder: (context, state) {
        return customTextFormField(
          controller: controller,
          lable: lable,
          formKey: _formKey,
          validatorTextMassage: "Please Enter Password",
          type: TextInputType.text,
          obscureText: state.passwordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              state.passwordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              context
                  .read<PasswordvisiblityBloc>()
                  .add(TogglePasswordVisibility());
            },
          ),
        );
      },
    );
  }

  Widget _signInButton() {
    return logInSignInForgotButton(label: buttonName, onPressed: () {});
  }

  Widget _thirdParty({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        titleBox(
            onTap: () {
              signInWithGoogle(context: context);
            },
            image: "assets/images/Google-Logo.png"),
        const SizedBox(width: 30),
        titleBox(onTap: () {}, image: "assets/images/Apple.jpg"),
      ],
    );
  }

  Widget _haveAccountrRow() {
    return loginRegistNow(
        message: "Already have an account?",
        buttonMessage: "Login now",
        onPressed: onPressed!);
  }
}
