part of 'update_profil_bloc.dart';

sealed class UpdateProfilState extends Equatable {
  const UpdateProfilState();

  @override
  List<Object> get props => [];
}

final class UpdateProfilInitial extends UpdateProfilState {}

final class UpdateProfilLoadingState extends UpdateProfilState {}

final class UpdateProfilSuccessState extends UpdateProfilState {
  final bool status;

  const UpdateProfilSuccessState({required this.status});
}

final class UpdateProfilFailureState extends UpdateProfilState {
  final String error;

  const UpdateProfilFailureState({required this.error});

  @override
  List<Object> get props => [error];
}
