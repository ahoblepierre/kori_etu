part of 'active_biometric_bloc.dart';

sealed class ActiveBiometricEvent extends Equatable {
  const ActiveBiometricEvent();

  @override
  List<Object> get props => [];
}


class ActiveBiometricLaunchEvent extends ActiveBiometricEvent {}
