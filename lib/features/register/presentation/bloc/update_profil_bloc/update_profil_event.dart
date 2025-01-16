part of 'update_profil_bloc.dart';

sealed class UpdateProfilEvent extends Equatable {
  const UpdateProfilEvent();

  @override
  List<Object> get props => [];
}

class UpdateProfilLoadingEvent extends UpdateProfilEvent {
  const UpdateProfilLoadingEvent();
}

class UpdateProfilFailureEvent extends UpdateProfilEvent {
  final String error;
  const UpdateProfilFailureEvent(this.error);
  @override
  List<Object> get props => [error];
}

class UpdateProfilSuccessEvent extends UpdateProfilEvent {
  const UpdateProfilSuccessEvent();
}

class UpdateProfilLoadParentingEvent extends UpdateProfilEvent {
  const UpdateProfilLoadParentingEvent();
}

class UpdateProfilLoadWaitingEvent extends UpdateProfilEvent {
  const UpdateProfilLoadWaitingEvent();
}
