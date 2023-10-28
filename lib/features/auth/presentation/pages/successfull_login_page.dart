import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:third_party_sign_in/core/network_info.dart';
import 'package:third_party_sign_in/features/auth/data/repository.dart';
import '../bloc/google_auth_cubit/google_auth_cubit.dart';

class SuccessFullLogin extends StatelessWidget {
  final FireBaseRepositoryImp fireBaseRepositoryImp = FireBaseRepositoryImp(
      networkInfo:
          NetworkInfoImpl(connectionChecker: InternetConnectionChecker()));
  SuccessFullLogin({super.key});
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocConsumer<GoogleAuthCubit, GoogleAuthState>(
            listener: (context, state) {},
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    context.read<GoogleAuthCubit>().signOut();
                  },
                  icon: const Icon(Icons.logout));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Success Login: ${user.email!}"),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton.icon(
              onPressed: () {
                fireBaseRepositoryImp.signUserOut();
              },
              icon: const Icon(Icons.logout),
              label: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
