part of 'active_biometric_bloc.dart';

sealed class ActiveBiometricState extends Equatable {
  const ActiveBiometricState();

  @override
  List<Object> get props => [];
}

final class ActiveBiometricInitial extends ActiveBiometricState {}

final class ActiveBiometricLoaded extends ActiveBiometricState {}

final class ActiveBiometricSucces extends ActiveBiometricState {}

final class ActiveBiometricError extends ActiveBiometricState {
  final String message;
  const ActiveBiometricError({required this.message});
  @override
  List<Object> get props => [message];
}
