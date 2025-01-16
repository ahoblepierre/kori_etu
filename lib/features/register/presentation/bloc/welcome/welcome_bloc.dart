import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeInitial()) {
    on<WelcomeEvent>((event, emit) async {});

    on<WelcomeInitEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 5));
      add(const GoToViewEvent(profil: 1));
    });

    on<GoToViewEvent>(goToViewEvent);
  }

  FutureOr<void> goToViewEvent(
      GoToViewEvent event, Emitter<WelcomeState> emit) {
    emit(GoToViewState(profil: event.profil));
  }
}
