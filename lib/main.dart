import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:third_party_sign_in/core/app_theme.dart';
import 'package:third_party_sign_in/core/network_info.dart';
import 'package:third_party_sign_in/features/auth/data/repository.dart';
import 'package:third_party_sign_in/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:third_party_sign_in/features/auth/presentation/bloc/google_auth_cubit/google_auth_cubit.dart';
import 'package:third_party_sign_in/features/auth/presentation/pages/auth_page.dart';
import 'package:third_party_sign_in/firebase_options.dart';
import 'features/auth/presentation/bloc/toggles/password_visiblity_bloc/passwordvisiblity_bloc.dart';
import 'features/auth/presentation/bloc/toggles/toggle_pages_bloc/bloc/toggle_pages_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
              signIn: FireBaseRepositoryImp(
                  networkInfo: NetworkInfoImpl(
                      connectionChecker: InternetConnectionChecker()))),
        ),
        BlocProvider(
          create: (context) => PasswordvisiblityBloc(),
        ),
        BlocProvider(
          create: (context) => TogglePagesBloc(),
        ),
        BlocProvider(
          create: (context) => GoogleAuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'third_party_sign_in',
        theme: appTheme,
        home: const AuthPage(),
      ),
    );
  }
}
