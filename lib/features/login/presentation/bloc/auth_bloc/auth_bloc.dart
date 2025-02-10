import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ip_country_lookup/ip_country_lookup.dart';
import 'package:kori_etu/core/constants/constants.dart';
import 'package:kori_etu/core/services/storage_service.dart';
import 'package:kori_etu/core/utils/utils_function.dart';
import 'package:kori_etu/features/login/data/model/auth_session_model.dart';
import 'package:kori_etu/features/login/domain/uses_case/authenticate_use_case.dart';
import 'package:logger/logger.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticateUseCase _authenticateUseCase;
  AuthBloc(this._authenticateUseCase) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});

    on<AuthLoginEvent>(authEventLoginEvent);

    on<AuthSendEvent>(authSendEvent);

    on<AuthChangePinEvent>(authChangePinEvent);

    on<BiometrieIsActiveEvent>(biometrieIsActiveEvent);

    on<BiometrieAuthEvent>(biometrieAuthEvent);
  }

  FutureOr<void> authEventLoginEvent(
      AuthLoginEvent event, Emitter<AuthState> emit) async {
    final storage = StorageService();

    Logger().f(event.codePin);

    if (event.codePin.length == 6) {
      /// gat app info
      final device = await getDevicesInfo();

      /// get user ip
      final ipData = await IpCountryLookup().getIpLocationData();

      /// Emit to load app
      emit(const AuthLoadedState());

      await Future.delayed(const Duration(seconds: 5));

      /// get user eamil
      final email = storage.getCache(authEmail);

      // ignore: unused_local_variable
      final Map<String, dynamic> user = {
        "username": email,
        "password": event.codePin,
        "platform": "${device.platform} ${device.deviceId}  ${device.osName}",
        "deviceRef": device.model,
        "deviceRefId": device.deviceId,
        "deviceOs": device.osName,
        "ipAddress": ipData.ip,
        "country": ipData.country_code
      };
      add(AuthSendEvent(user));
    }
  }

  FutureOr<void> authSendEvent(
      AuthSendEvent event, Emitter<AuthState> emit) async {
    final httpDataResponse = await _authenticateUseCase.call(event.auth);

    AuthSessionModel auth = AuthSessionModel(
        sessionId: '',
        accessToken: null,
        sessionStatus: '',
        profile: Profile(
            profileId: 1,
            currency: "currency",
            enabled: true,
            enabledDate: DateTime.now(),
            isProfileStudent: true,
            user: User(
                userId: 2,
                lastname: "lastname",
                firstname: "firstname",
                gender: "M",
                civility: "civility",
                photo: "photo",
                country: "country",
                countryCode: "countryCode",
                city: "city",
                mobile: "mobile",
                email: "email",
                profession: "profession",
                role: "role",
                status: "status",
                createdOn: DateTime.now(),
                updatedOn: DateTime.now())),
        platform: '',
        deviceRef: '',
        deviceRefId: '',
        deviceOs: '',
        ipAddress: '',
        lastConnected: null);

      final storage = StorageService();
      storage.setIsAuthenticated(); // set is authenticated
      storage.setIsDateNowToLogin(); // set is date now to login

    emit(AuthSuccessState(authSessionModel: auth));

    // httpDataResponse.fold((dataFail) {
    //   emit(AuthErrorState(error: dataFail.error!));
    // }, (dataSuccess) {
    //   final storage = StorageService();
    //   storage.setIsAuthenticated(); // set is authenticated
    //   storage.setIsDateNowToLogin(); // set is date now to login
    //   emit(AuthSuccessState(authSessionModel: dataSuccess.data!));
    // });
  }

  FutureOr<void> authChangePinEvent(
      AuthChangePinEvent event, Emitter<AuthState> emit) {
    Logger().i(event.codePin);
  }

  FutureOr<void> biometrieIsActiveEvent(
      BiometrieIsActiveEvent event, Emitter<AuthState> emit) {
    if (event.isActive) {
      emit(BiometricIsSupportedSate(isSupported: event.isActive));
    } else {
      emit(const BiometricNotSupportedState(notSupported: "Not supported"));
    }
  }

  FutureOr<void> biometrieAuthEvent(
      BiometrieAuthEvent event, Emitter<AuthState> emit) {
    if (event.isLogin) {
      emit(BiometricAuthenticationState());
    } else {
      emit(BiometricAuthFailed());
    }
  }
}
