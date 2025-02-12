part of 'code_pin_bloc.dart';

sealed class CodePinEvent extends Equatable {
  const CodePinEvent();

  @override
  List<Object> get props => [];
}

class InitCodePinEvent extends CodePinEvent {}

class SetFirstCodePinEvent extends CodePinEvent {
  final String enteredCode;
  const SetFirstCodePinEvent({required this.enteredCode});
  @override
  List<Object> get props => [enteredCode];
}

class SetSecondCodePinEvent extends CodePinEvent {
  final String firstCode;
  final String secondeCode;
  const SetSecondCodePinEvent({
    required this.firstCode,
    required this.secondeCode,
  });
  @override
  List<Object> get props => [firstCode, secondeCode];
}

class CodePinChangeEvent extends CodePinEvent {}

class ErreurCodePinEvent extends CodePinEvent {}

class AuthWithCodePinEvent extends CodePinEvent {
  final String enteredCode;
  const AuthWithCodePinEvent({
    required this.enteredCode,
  });
  @override
  List<Object> get props => [enteredCode];
}

class GoToCodePinEvent extends CodePinEvent {}
