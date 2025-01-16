part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthLoginEvent extends AuthEvent {
  final String codePin;
  const AuthLoginEvent(this.codePin);
  @override
  List<Object> get props => [codePin];
}

class AuthChangePinEvent extends AuthEvent {
  final String codePin;
  const AuthChangePinEvent(this.codePin);
  @override
  List<Object> get props => [codePin];
}

class AuthSendEvent extends AuthEvent {
  final Map<String, dynamic> auth;
  const AuthSendEvent(this.auth);
  @override
  List<Object> get props => [auth];
}

class BiometrieIsActiveEvent extends AuthEvent {
  final bool isActive;
  const BiometrieIsActiveEvent({required this.isActive});
  @override
  List<Object> get props => [isActive];
}

class BiometrieAuthEvent extends AuthEvent {
  final bool isLogin;
  const BiometrieAuthEvent({required this.isLogin});
  @override
  List<Object> get props => [isLogin];
}
