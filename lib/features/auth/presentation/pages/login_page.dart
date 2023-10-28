import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:third_party_sign_in/core/util/navigator_push.dart';
import 'package:third_party_sign_in/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:third_party_sign_in/features/auth/presentation/widgets/continue_with_divider.dart';
import 'package:third_party_sign_in/features/auth/presentation/widgets/login_regist_now.dart';
import 'package:third_party_sign_in/features/auth/presentation/widgets/login_signin_button.dart';
import 'package:third_party_sign_in/features/auth/presentation/widgets/text_field_widget.dart';
import 'package:third_party_sign_in/features/auth/presentation/widgets/title_box.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../bloc/google_auth_cubit/google_auth_cubit.dart';
import '../bloc/toggles/password_visiblity_bloc/passwordvisiblity_bloc.dart';
import 'successfull_login_page.dart';

class LogInPage extends StatelessWidget {
  final Function()? onPressed;
  LogInPage({Key? key, required this.onPressed, required this.buttonName})
      : super(key: key);
  final String buttonName;
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

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
                      _passwordTextField(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        pageView(
                            context: context, widget: ForgotPasswordPage());
                      },
                      child: const Text(
                        "Forgot Password?",
                      ),
                    ),
                  ],
                ),
                _loginButton(),
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
                _notmemberRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: const Text('Log In'),
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

  Widget _passwordTextField() {
    return BlocBuilder<PasswordvisiblityBloc, PasswordVisiblityState>(
      builder: (context, state) {
        return customTextFormField(
          controller: _passwordController,
          lable: "Password",
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

  Widget _loginButton() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is LoadingLoginState) {const Center(child: CircularProgressIndicator());}
        else if (state is SuccessfullLogInState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SuccessFullLogin()),
            );
          });
        } else if (state is FailureLogInState) {
          Fluttertoast.showToast(msg: state.message);
        }
        return logInSignInForgotButton(
            label: buttonName,
            onPressed: () {
              context.read<AuthBloc>().add(LoginEvent(
                  email: _emailController.text,
                  password: _passwordController.text));
            });
      },
    );
  }

  Widget _thirdParty({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocConsumer<GoogleAuthCubit, GoogleAuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            return titleBox(
                onTap: () {
                  context.read<GoogleAuthCubit>().login();
                },
                image: "assets/images/Google-Logo.png");
          },
        ),
        const SizedBox(width: 30),
        titleBox(onTap: () {}, image: "assets/images/Apple.jpg"),
      ],
    );
  }

  Widget _notmemberRow() {
    return loginRegistNow(
        message: "Not a member?",
        buttonMessage: "Register now",
        onPressed: onPressed!);
  }
} 
