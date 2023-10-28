import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'toggle_pages_event.dart';
part 'toggle_pages_state.dart';

class TogglePagesBloc extends Bloc<TogglePagesEvent, TogglePagesState> {
  TogglePagesBloc() : super(const ShowLoginTrue()) {
    on<TogglePagesEvent>((event, emit) {
      if (event is TogglePagesClickEvent) {
        state is ShowLoginTrue
            ? emit(const ShowLoginFalse())
            : emit(const ShowLoginTrue());
      }
    });
  }
}
