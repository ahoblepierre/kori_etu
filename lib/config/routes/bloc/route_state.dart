part of 'route_bloc.dart';

sealed class RouteState extends Equatable {
  const RouteState();

  @override
  List<Object> get props => [];
}

final class RouteInitial extends RouteState {}

final class OnboardingHasSeenState extends RouteState {
  final bool hasSeenState;
  const OnboardingHasSeenState({required this.hasSeenState});
  @override
  List<Object> get props => [hasSeenState];
}
