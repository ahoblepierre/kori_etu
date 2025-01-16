part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class ChangeInputEvent extends RegisterEvent {
  final bool isChange;
  const ChangeInputEvent(this.isChange);
  @override
  List<Object> get props => [isChange];
}

class RegisterCreateSessionEvent extends RegisterEvent {
  final RegisterUser user;
  const RegisterCreateSessionEvent(this.user);
  @override
  List<Object> get props => [user];
}

class InitialEmailEvent extends RegisterEvent {
  const InitialEmailEvent();
  @override
  List<Object> get props => [];
}

class ReSendEmailEvent extends RegisterEvent {
  final RegisterUser user;
  const ReSendEmailEvent(this.user);
  @override
  List<Object> get props => [user];
}

class ReSendEmailSuccessEvent extends RegisterEvent {
  const ReSendEmailSuccessEvent();
  @override
  List<Object> get props => [];
}
