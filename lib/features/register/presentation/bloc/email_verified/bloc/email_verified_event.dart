part of 'email_verified_bloc.dart';

sealed class EmailVerifiedEvent extends Equatable {
  const EmailVerifiedEvent();

  @override
  List<Object> get props => [];
}



class EmailVerifiedFectchEvent extends EmailVerifiedEvent {
  final String token;
  const EmailVerifiedFectchEvent({required this.token});
  @override
  List<Object> get props => [token];
}
