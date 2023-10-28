import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/error/failures.dart';
import '../../../data/repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepsitory signIn;
  AuthBloc({required this.signIn}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoadingLoginState());

        final failureOrLogInState = await signIn.signInWithEmailAndPassword(
            emailController: event.email, passwordController: event.password);

        emit(_mapFailureOrLogInState(failureOrLogInState));
      }
    });
  }

  AuthState _mapFailureOrLogInState(Either<Failure, UserCredential> either) {
    return either.fold(
      (failure) => FailureLogInState(message: _mapFailureToMessage(failure)),
      (user) => SuccessfullLogInState(user: user),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "SERVER_FAILURE_MESSAGE";
      case EmptyCacheFailure:
        return "EMPTY_CACHE_FAILURE_MESSAGE";
      case OfflineFailure:
        return "OFFLINE_FAILURE_MESSAGE";
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
