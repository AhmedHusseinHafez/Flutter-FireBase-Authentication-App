part of 'toggle_pages_bloc.dart';

abstract class TogglePagesState extends Equatable {
  const TogglePagesState({this.showLoginPage = true});
  final bool showLoginPage;

  @override
  List<Object> get props => [showLoginPage];
}

class ShowLoginFalse extends TogglePagesState {
  const ShowLoginFalse({super.showLoginPage = false});
  @override
  List<Object> get props => [showLoginPage];
}
class ShowLoginTrue extends TogglePagesState {
  const ShowLoginTrue({super.showLoginPage = true});
  @override
  List<Object> get props => [showLoginPage];
}
