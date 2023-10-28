part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class LoadingLoginState extends AuthState {}

class SuccessfullLogInState extends AuthState {
  final UserCredential user;

  const SuccessfullLogInState({required this.user});
  @override
  List<Object> get props => [user];
}

class FailureLogInState extends AuthState {
  final String message;

  const FailureLogInState({required this.message});
  @override
  List<Object> get props => [message];
}
