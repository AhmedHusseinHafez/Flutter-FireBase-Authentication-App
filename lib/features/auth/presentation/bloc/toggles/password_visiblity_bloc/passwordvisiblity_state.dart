part of 'passwordvisiblity_bloc.dart';

abstract class PasswordVisiblityState extends Equatable {
  const PasswordVisiblityState({this.passwordVisible=true});
  final bool passwordVisible;
  @override
  List<Object> get props => [passwordVisible];
}

class PasswordVisible extends PasswordVisiblityState {
  const PasswordVisible({super.passwordVisible=false});

  @override
  List<Object> get props => [passwordVisible];
}

class PasswordHidden extends PasswordVisiblityState {
  const PasswordHidden({super.passwordVisible=true});
  @override
  List<Object> get props => [passwordVisible];
}
