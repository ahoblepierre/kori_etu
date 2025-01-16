part of 'onboarding_bloc.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

final class OnboardingInitial extends OnboardingState {}

final class OnboardingWelcome extends OnboardingState {}

final class OnboardingGetStarted extends OnboardingState {}

final class OnboardingCompletedState extends OnboardingState {}
