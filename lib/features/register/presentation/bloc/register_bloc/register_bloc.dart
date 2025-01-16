import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kori_etu/features/register/data/models/register_user.dart';
import 'package:kori_etu/features/register/domain/usescases/register_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsecase _registerUsecase;
  RegisterBloc(this._registerUsecase) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ChangeInputEvent>(changeInputEvent);
    on<RegisterCreateSessionEvent>(registerCreateSession);

    on<InitialEmailEvent>(initialEmailEvent);

    on<ReSendEmailEvent>(reSendEmailEvent);
    on<ReSendEmailSuccessEvent>(reSendEmailSuccessEvent);
  }

  FutureOr<void> changeInputEvent(
      ChangeInputEvent event, Emitter<RegisterState> emit) {
    emit(ChangeInputState(event.isChange));
  }

  FutureOr<void> registerCreateSession(
      RegisterCreateSessionEvent event, Emitter<RegisterState> emit) async {
    //Loader
    emit(const RegisterLoadingState());
    final dataState = await _registerUsecase(event.user);
    dataState.fold(
      (dataFail) => emit(RegisterError(dataFail.error!)),
      (dataSuccess) => emit(const RegisterSessionSuccess()),
    );
  }

  FutureOr<void> initialEmailEvent(
      InitialEmailEvent event, Emitter<RegisterState> emit) {
    emit(const InitialVerifyEmailState());
  }

  FutureOr<void> reSendEmailEvent(
      ReSendEmailEvent event, Emitter<RegisterState> emit) async {
    emit(const RegisterLoadingState());
    final dataState = await _registerUsecase(event.user);
    dataState.fold(
      (dataFail) => emit(RegisterError(dataFail.error!)),
      (dataSuccess) async {
        add(const ReSendEmailSuccessEvent());
        await Future.delayed(const Duration(minutes: 5))
            .whenComplete(() => add(const InitialEmailEvent()));
      },
    );
  }

  FutureOr<void> reSendEmailSuccessEvent(
      ReSendEmailSuccessEvent event, Emitter<RegisterState> emit) {
    emit(const RegisterSessionSuccess());
  }
}
