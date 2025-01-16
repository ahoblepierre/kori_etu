part of 'welcome_bloc.dart';

sealed class WelcomeEvent extends Equatable {
  const WelcomeEvent();

  @override
  List<Object> get props => [];
}

class WelcomeInitEvent extends WelcomeEvent {
  const WelcomeInitEvent();

  @override
  List<Object> get props => [];
}

class GoToViewEvent extends WelcomeEvent {
  final int profil;
  const GoToViewEvent({required this.profil});
  @override
  List<Object> get props => [profil];
}
