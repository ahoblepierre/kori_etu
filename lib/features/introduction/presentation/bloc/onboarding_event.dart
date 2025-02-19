part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class OnboardingStartedEvent extends OnboardingEvent {}

class OnboardingCompletedEvent extends OnboardingEvent {}
