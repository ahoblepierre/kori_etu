part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

class ChangeInputState extends RegisterState {
  final bool isChange;
  const ChangeInputState(this.isChange);
  @override
  List<Object> get props => [isChange];
}

/// Debut du lancement de la creation de la session
class RegisterLoadingState extends RegisterState {
  const RegisterLoadingState();
}

/// Une erreur c'est produite lors de la creation de la sessiosn
class RegisterError extends RegisterState {
  final String errorMessage;
  const RegisterError(this.errorMessage);
}

/// Creation de la session
class RegisterSessionSuccess extends RegisterState {
  const RegisterSessionSuccess();
}


///Initiation pour verifier l'email
class InitialVerifyEmailState extends RegisterState {
  const InitialVerifyEmailState();
}


///Initiation pour verifier l'email
class ResendEmailState extends RegisterState {
  const ResendEmailState();
}


/// active biometrie
class ActiveBiometricState extends RegisterState {
  const ActiveBiometricState();
}
