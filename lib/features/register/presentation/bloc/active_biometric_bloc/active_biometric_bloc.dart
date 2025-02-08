import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kori_etu/core/services/storage_service.dart';
import 'package:kori_etu/features/login/data/data_source/local_auth.dart';
import 'package:kori_etu/features/register/domain/usescases/active_biometric_usecase.dart';

part 'active_biometric_event.dart';
part 'active_biometric_state.dart';

class ActiveBiometricBloc
    extends Bloc<ActiveBiometricEvent, ActiveBiometricState> {
  final ActiveBiometricUsecase _activeBiometricUsecase;
  ActiveBiometricBloc(this._activeBiometricUsecase)
      : super(ActiveBiometricInitial()) {
    on<ActiveBiometricEvent>((event, emit) async {});

    on<ActiveBiometricLaunchEvent>((event, emit) async {
      final auth = LocalAuth();
      emit(ActiveBiometricLoaded());

      final bool isSupporter = await auth.isSupported();

      if (!isSupporter) {
        emit(
          const ActiveBiometricError(
              message:
                  "Votre téléphone portable de ne prend pas en charge la biométrie"),
        );
        return;
      }
      final httpDataResponse = await _activeBiometricUsecase.call(null);

      emit(ActiveBiometricSucces());

      //   httpDataResponse.fold((dataFail) {
      //     emit(ActiveBiometricError(message: dataFail.error!));
      //   }, (dataSuccess) {
      //     StorageService().setBiometricIsActif();
      //     emit(ActiveBiometricSucces());
      //   });
    });
  }
}
