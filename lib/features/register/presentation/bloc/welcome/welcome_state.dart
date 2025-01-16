part of 'welcome_bloc.dart';

sealed class WelcomeState extends Equatable {
  const WelcomeState();

  @override
  List<Object> get props => [];
}

final class WelcomeInitial extends WelcomeState {}

final class WelcomeInitState extends WelcomeState {
  const WelcomeInitState();
  @override
  List<Object> get props => [];
}

final class GoToViewState extends WelcomeState {
  final int profil;
  const GoToViewState({required this.profil});
  @override
  List<Object> get props => [profil];
}
