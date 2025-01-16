part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoadedState extends AuthState {
  const AuthLoadedState();
  @override
  List<Object> get props => [];
}

final class AuthPinCnahgeState extends AuthState {
  final String pin;

  const AuthPinCnahgeState({required this.pin});

  @override
  List<Object> get props => [pin];
}

final class AuthSuccessState extends AuthState {
  final AuthSessionModel authSessionModel;
  const AuthSuccessState({required this.authSessionModel});
  @override
  List<Object> get props => [authSessionModel];
}

final class AuthErrorState extends AuthState {
  final String error;

  const AuthErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

final class BiometricIsSupportedSate extends AuthState {
  final bool isSupported;
  const BiometricIsSupportedSate({required this.isSupported});

  @override
  List<Object> get props => [];
}

final class BiometricNotSupportedState extends AuthState {
  final String notSupported;
  const BiometricNotSupportedState({required this.notSupported});

  @override
  List<Object> get props => [notSupported];
}

final class BiometricAuthenticationState extends AuthState {}

final class BiometricAuthFailed extends AuthState {}
