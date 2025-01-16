part of 'email_verified_bloc.dart';

sealed class EmailVerifiedState extends Equatable {
  const EmailVerifiedState();

  @override
  List<Object> get props => [];
}

final class EmailVerifiedInitial extends EmailVerifiedState {}

final class EmailVerifiedSucces extends EmailVerifiedState {
  final ProfilEntity profil;
  const EmailVerifiedSucces(this.profil);
  @override
  List<Object> get props => [];
}

final class EmailVerifiedError extends EmailVerifiedState {
  final String errorMessage;
  const EmailVerifiedError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
