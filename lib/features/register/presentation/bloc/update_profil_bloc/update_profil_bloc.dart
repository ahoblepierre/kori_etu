import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kori_etu/features/register/domain/usescases/change_profil_usecase.dart';

part 'update_profil_event.dart';
part 'update_profil_state.dart';

class UpdateProfilBloc extends Bloc<UpdateProfilEvent, UpdateProfilState> {
  final ChangeProfilUsecase _changeProfilUsecase;
  UpdateProfilBloc(this._changeProfilUsecase) : super(UpdateProfilInitial()) {
    on<UpdateProfilEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<UpdateProfilLoadingEvent>(updateProfilLoadingEvent);

    on<UpdateProfilLoadParentingEvent>(updateProfilLoadParentingEvent);

    on<UpdateProfilLoadWaitingEvent>(updateProfilLoadWaitingEvent);

    on<UpdateProfilLoadWaitingEventEtu>(updateProfilLoadWaitingEventEtu);
  }

  FutureOr<void> updateProfilLoadingEvent(
      UpdateProfilLoadingEvent event, Emitter<UpdateProfilState> emit) async {
    emit(UpdateProfilLoadingState());

    // final httpDataresponse = await _changeProfilUsecase(null);

    // httpDataresponse.fold((dataFail) {
    //   emit(UpdateProfilFailureState(error: dataFail.error!));
    // }, (dataSuccess) {
    //   emit(UpdateProfilSuccessState());
    // });
    await Future.delayed(const Duration(seconds: 5));
    add(const UpdateProfilLoadWaitingEventEtu());
  }

  FutureOr<void> updateProfilLoadParentingEvent(
      UpdateProfilLoadParentingEvent event,
      Emitter<UpdateProfilState> emit) async {
    emit(UpdateProfilLoadingState());

    await Future.delayed(const Duration(seconds: 5));
    add(const UpdateProfilLoadWaitingEvent());
  }

  FutureOr<void> updateProfilLoadWaitingEvent(
      UpdateProfilLoadWaitingEvent event, Emitter<UpdateProfilState> emit) {
    emit(const UpdateProfilSuccessState(status: false));
  }

  FutureOr<void> updateProfilLoadWaitingEventEtu(
      UpdateProfilLoadWaitingEventEtu event, Emitter<UpdateProfilState> emit) {
    emit(const UpdateProfilSuccessState(status: true));
  }
}
