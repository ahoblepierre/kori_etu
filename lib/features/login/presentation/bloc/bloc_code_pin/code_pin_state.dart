part of 'code_pin_bloc.dart';

sealed class CodePinState extends Equatable {
  const CodePinState();

  @override
  List<Object> get props => [];
}

final class CodePinInitialState extends CodePinState {}

final class SetCodePinState extends CodePinState {
  final String code;
  const SetCodePinState({required this.code});
  @override
  List<Object> get props => [code];
}



final class CodePinLoadingState extends CodePinState {}

final class ErreurCodePinInitialState extends CodePinState {}


final class CodePinSuccessState extends CodePinState {}


final class ErreurCodePinState extends CodePinState{
  final String message;
  const ErreurCodePinState({required this.message});
  @override
  List<Object> get props => [message];
}
