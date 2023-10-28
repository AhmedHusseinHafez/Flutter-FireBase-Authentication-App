part of 'toggle_pages_bloc.dart';

abstract class TogglePagesEvent extends Equatable {
  const TogglePagesEvent();

  @override
  List<Object> get props => [];
}

class TogglePagesClickEvent extends TogglePagesEvent{}
