import 'package:get_it/get_it.dart';
import 'package:kori_etu/features/login/domain/uses_case/authenticate_use_case.dart';
import 'package:kori_etu/features/login/domain/uses_case/login_uses_case.dart';
import 'package:kori_etu/features/login/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:kori_etu/features/login/presentation/bloc/bloc_code_pin/code_pin_bloc.dart';
import 'package:kori_etu/features/register/data/data_source/register_service.dart';
import 'package:kori_etu/features/register/data/repository/register_user_repository_impl.dart';
import 'package:kori_etu/features/register/domain/repository/register_user_repository.dart';
import 'package:kori_etu/features/register/domain/usescases/active_biometric_usecase.dart';
import 'package:kori_etu/features/register/domain/usescases/change_profil_usecase.dart';
import 'package:kori_etu/features/register/domain/usescases/register_usecase.dart';
import 'package:kori_etu/features/register/domain/usescases/verify_email_usecase.dart';
import 'package:kori_etu/features/register/presentation/bloc/active_biometric_bloc/active_biometric_bloc.dart';
import 'package:kori_etu/features/register/presentation/bloc/email_verified/bloc/email_verified_bloc.dart';
import 'package:kori_etu/features/register/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:kori_etu/features/register/presentation/bloc/update_profil_bloc/update_profil_bloc.dart';

import 'core/resources/http_client.dart';

final getIt = GetIt.I;

Future<void> initializeDependances() async {
  // http
  getIt.registerSingleton<HttpClient>(HttpClient());

  /// Register dependencies
  initRegisterDependences();

  /// ===== Email verify ==============
  initVerifyEmailDependes();

  /// ===== Code pin ==============
  codePinDepences();

  /// biometric
  activeBiometricDependes();

  /// Auth
  authDependences();

  /// change profil
  changeProfilDependece();
}

/// Register dependencies
Future<void> initRegisterDependences() async {
  //Register  Service injection
  getIt
      .registerSingleton<RegisterService>(RegisterService(getIt<HttpClient>()));

  // register implementation
  getIt.registerSingleton<RegisterUserRepository>(
      (RegisterUserRepositoryImpl(getIt<RegisterService>())));

  // Use aces
  getIt.registerSingleton<RegisterUsecase>(
      RegisterUsecase(getIt<RegisterUserRepository>()));

  // Bloc
  getIt.registerFactory<RegisterBloc>(
      () => RegisterBloc(getIt<RegisterUsecase>()));
}

/// Verify email dependency
Future<void> initVerifyEmailDependes() async {
  // Use cases
  getIt.registerSingleton<VerifyEmailUseCase>(
      VerifyEmailUseCase(getIt<RegisterUserRepository>()));

  // Bloc
  getIt.registerFactory<EmailVerifiedBloc>(
    () => EmailVerifiedBloc(getIt<VerifyEmailUseCase>()),
  );
}

/// Active biometric
Future<void> activeBiometricDependes() async {
  // Use cases
  getIt.registerSingleton<ActiveBiometricUsecase>(
      ActiveBiometricUsecase(getIt<RegisterUserRepository>()));

  //bloc
  getIt.registerFactory<ActiveBiometricBloc>(
    () => ActiveBiometricBloc(getIt<ActiveBiometricUsecase>()),
  );
}

Future<void> codePinDepences() async {
  //use cases
  getIt.registerSingleton<LoginUsesCase>(
      LoginUsesCase(getIt<RegisterUserRepository>()));

  getIt.registerFactory<CodePinBloc>(() => CodePinBloc(getIt<LoginUsesCase>()));
}

// auth bloc
Future<void> authDependences() async {
  // Use cases
  getIt.registerSingleton<AuthenticateUseCase>(
      AuthenticateUseCase(getIt<RegisterUserRepository>()));

  // Bloc
  getIt.registerFactory<AuthBloc>(() => AuthBloc(getIt<AuthenticateUseCase>()));
}

/// change profil
Future<void> changeProfilDependece() async {
  // Use cases
  getIt.registerSingleton<ChangeProfilUsecase>(
      ChangeProfilUsecase(getIt<RegisterUserRepository>()));

  // Bloc
  getIt.registerFactory<UpdateProfilBloc>(
      () => UpdateProfilBloc(getIt<ChangeProfilUsecase>()));
}