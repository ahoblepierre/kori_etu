import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kori_etu/core/services/storage_service.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<OnboardingEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<OnboardingStartedEvent>(onboardingStartedEvent);

    on<OnboardingCompletedEvent>(onboardingCompletedEvent);
  }

  FutureOr<void> onboardingStartedEvent(
      OnboardingStartedEvent event, Emitter<OnboardingState> emit) async {
    emit(OnboardingGetStarted());
    await Future.delayed(const Duration(seconds: 2));
    add(OnboardingCompletedEvent());
  }

  FutureOr<void> onboardingCompletedEvent(
      OnboardingCompletedEvent event, Emitter<OnboardingState> emit) {
    /// Marquer comme vue
    StorageService().setCompletedOnboarding();
    emit(OnboardingCompletedState());
  }
}
