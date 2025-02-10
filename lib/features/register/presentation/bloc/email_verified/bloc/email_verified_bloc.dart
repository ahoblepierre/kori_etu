// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kori_etu/features/register/domain/entities/profil_entity.dart';
import 'package:kori_etu/features/register/domain/usescases/verify_email_usecase.dart';

part 'email_verified_event.dart';
part 'email_verified_state.dart';

class EmailVerifiedBloc extends Bloc<EmailVerifiedEvent, EmailVerifiedState> {
  final VerifyEmailUseCase _verifyEmailUseCase;

  EmailVerifiedBloc(this._verifyEmailUseCase) : super(EmailVerifiedInitial()) {
    on<EmailVerifiedEvent>((event, emit) {});

    on<EmailVerifiedFectchEvent>(emailVerifiedFectchEvent);
  }

  FutureOr<void> emailVerifiedFectchEvent(
      EmailVerifiedFectchEvent event, Emitter<EmailVerifiedState> emit) async {
    // final dataStateResponse = await _verifyEmailUseCase(event.token);
    emit(EmailVerifiedInitial());

    ProfilEntity profil = ProfilEntity(
        biometricsEnabledAt: DateTime.now(),
        user: null,
        profileId: null,
        currency: '',
        enabled: false,
        enabledDate: null,
        isProfileStudent: null,
        profileStudentEnabledAt: null,
        isBiometricsActive: null,
        threshold: null);

    emit(EmailVerifiedSucces(profil));
    // Traiter le résultat
    // dataStateResponse.fold(
    //   (dataFail) {
    //     // En cas d'erreur, émettre l'état d'erreur
    //     Logger()
    //         .e("Erreur lors de la vérification de l'email: ${dataFail.error}");
    //     emit(EmailVerifiedError(errorMessage: dataFail.error!));
    //   },
    //   (dataSuccess) {
    //     emit(EmailVerifiedSucces(dataSuccess.data!));
    //   },
    // );
  }
}
