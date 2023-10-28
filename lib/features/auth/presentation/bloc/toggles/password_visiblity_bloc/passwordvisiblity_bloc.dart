import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'passwordvisiblity_event.dart';
part 'passwordvisiblity_state.dart';

class PasswordvisiblityBloc
    extends Bloc<PasswordVisiblityEvent, PasswordVisiblityState> {
  PasswordvisiblityBloc() : super(const PasswordHidden()) {
    on<PasswordVisiblityEvent>((event, emit) {
      if (event is TogglePasswordVisibility ) {
        state is PasswordHidden
            ? emit(const PasswordVisible())
            : emit(const PasswordHidden());
      }
    });

  }
}
