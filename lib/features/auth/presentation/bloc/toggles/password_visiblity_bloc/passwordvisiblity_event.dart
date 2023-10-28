part of 'passwordvisiblity_bloc.dart';

abstract class PasswordVisiblityEvent extends Equatable {
  const PasswordVisiblityEvent();

  @override
  List<Object> get props => [];
}
class TogglePasswordVisibility extends PasswordVisiblityEvent{}
