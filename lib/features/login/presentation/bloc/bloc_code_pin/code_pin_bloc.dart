import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kori_etu/core/constants/constants.dart';
import 'package:kori_etu/core/services/storage_service.dart';
import 'package:kori_etu/features/login/domain/uses_case/login_uses_case.dart';
import 'package:kori_etu/features/register/data/models/register_user.dart';

part 'code_pin_event.dart';
part 'code_pin_state.dart';

class CodePinBloc extends Bloc<CodePinEvent, CodePinState> {
  final LoginUsesCase _loginUsesCase;
  CodePinBloc(this._loginUsesCase) : super(CodePinInitialState()) {
    on<CodePinEvent>((event, emit) {});

    on<SetFirstCodePinEvent>(setFirstCodePinEvent);

    on<ErreurCodePinEvent>(erreurCodePinEvent);

    on<AuthWithCodePinEvent>(authWithCodePinEvent);

    on<GoToCodePinEvent>(goToCodePinEvent);
  }

  FutureOr<void> initCodePinEvent(
      InitCodePinEvent event, Emitter<CodePinState> emit) {
    emit(CodePinInitialState());
  }

  FutureOr<void> setFirstCodePinEvent(
      SetFirstCodePinEvent event, Emitter<CodePinState> emit) {
    emit(SetCodePinState(code: event.enteredCode));
    if (event.enteredCode.length > 6) {}
  }

  FutureOr<void> erreurCodePinEvent(
      ErreurCodePinEvent event, Emitter<CodePinState> emit) {
    emit(ErreurCodePinInitialState());
  }

  FutureOr<void> authWithCodePinEvent(
      AuthWithCodePinEvent event, Emitter<CodePinState> emit) async {
    emit(CodePinLoadingState());
    final storage = StorageService();

    final email = storage.getCache(authEmail);

    final userLogin = RegisterUser(
      email: email,
      targetUrl: 'korimt.com',
      platform: "",
      deviceRef: "",
      deviceRefId: "",
      deviceOs: "",
      ipAddress: "",
      country: "",
      password: event.enteredCode,
    );
    // final dataResponse = await _loginUsesCase(userLogin);

    storage.setIsAuthenticated(); // set isAuthenticated

    storage.setIsDateNowToLogin(); // set isDateNowToLogin

    storage.setCache("pin", event.enteredCode);

    await Future.delayed(const Duration(seconds: 3));

    add(GoToCodePinEvent());

    // dataResponse.fold((dataFail) {
    //   Logger().i(dataFail.data.toString());
    //   emit(ErreurCodePinState(
    //     message: dataFail.data ?? " Une erreur s'est produite",
    //   ));
    // }, (dataSuccess) {
    //   StorageService().saveAuthSession(dataSuccess.data!);
    //   storage.setIsAuthenticated(); // set isAuthenticated
    //   storage.setIsDateNowToLogin(); // set isDateNowToLogin
    //   emit(CodePinSuccessState());
    // });
  }

  FutureOr<void> goToCodePinEvent(
      GoToCodePinEvent event, Emitter<CodePinState> emit) {
    emit(CodePinSuccessState());
  }
}
