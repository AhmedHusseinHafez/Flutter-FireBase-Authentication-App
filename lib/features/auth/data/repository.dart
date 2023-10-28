import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../../../core/network_info.dart';

abstract class AuthRepsitory {
/////////////////////////////////////////////////////////////////
  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword({
    required String emailController,
    required String passwordController,
  });
/////////////////////////////////////////////////////////////////
  Future<Either<Failure, UserCredential>> createUserWithEmailAndPassword(
      {required String email, required String password});
/////////////////////////////////////////////////////////////////
  Future<Either<Failure, void>> sendPasswordResetEmail({required String email});
/////////////////////////////////////////////////////////////////
  Future<Either<Failure, void>> signUserOut();
}

class FireBaseRepositoryImp implements AuthRepsitory {
  final NetworkInfo networkInfo;
  FireBaseRepositoryImp({required this.networkInfo});
/////////////////////////////////////////////////////////////
  @override
  signInWithEmailAndPassword({
    required String emailController,
    required String passwordController,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final signIn = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController, password: passwordController);
        return Right(signIn);
      } on FirebaseAuthException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
/////////////////////////////////////////////////////////////
  @override
  createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        final createUser = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        return Right(createUser);
      } on FirebaseAuthException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
/////////////////////////////////////////////////////////////
  @override
  signUserOut() async {
    if (await networkInfo.isConnected) {
      try {
        final signOut = await FirebaseAuth.instance.signOut();
        return Right(signOut);
      } on FirebaseAuthException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
/////////////////////////////////////////////////////////////
  @override
  Future<Either<Failure, void>> sendPasswordResetEmail(
      {required String email}) async {
    if (await networkInfo.isConnected) {
      try {
        final resetPassword =await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        return Right(resetPassword);
      } on FirebaseAuthException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
/////////////////////////////////////////////////////////////
}
