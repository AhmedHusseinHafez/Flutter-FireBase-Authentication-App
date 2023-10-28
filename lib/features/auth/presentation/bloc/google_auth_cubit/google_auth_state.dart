part of 'google_auth_cubit.dart';

abstract class GoogleAuthState extends Equatable {
  const GoogleAuthState();

  @override
  List<Object> get props => [];
}

final class GoogleAuthInitial extends GoogleAuthState {}

final class GoogleAuthLoadingState extends GoogleAuthState {}

final class GoogleAuthSuccessState extends GoogleAuthState {
  final User user;

  const GoogleAuthSuccessState(this.user);
  @override
  List<Object> get props => [user];
}

final class GoogleAuthErrorState extends GoogleAuthState {
  final String error;

  const GoogleAuthErrorState(this.error);
  @override
  List<Object> get props => [error];
}
