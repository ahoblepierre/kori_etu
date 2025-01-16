import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:kori_etu/core/constants/constants.dart';
import 'package:kori_etu/core/resources/data_state.dart';
import 'package:kori_etu/core/services/storage_service.dart';
import 'package:kori_etu/features/login/data/model/auth_session_model.dart';
import 'package:kori_etu/features/register/data/data_source/register_service.dart';
import 'package:kori_etu/features/register/data/models/profil_model.dart';
import 'package:kori_etu/features/register/data/models/register_user.dart';
import 'package:kori_etu/features/register/domain/repository/register_user_repository.dart';
import 'package:logger/web.dart';

class RegisterUserRepositoryImpl implements RegisterUserRepository {
  final RegisterService _registerService;

  RegisterUserRepositoryImpl(this._registerService);

  @override
  Future<Either<DataFailed, DataSuccess>> register(
      {required RegisterUser registerUser}) async {
    try {
      final httpResponse =
          await _registerService.register(registerUser: registerUser);

      if (httpResponse.statusCode == HttpStatus.ok) {
        Logger().i('Enregistrement réussi');
        Logger().i(httpResponse.data);

        /// Sauvegarder le token
        StorageService().setCache(
          emailTokenValidite,
          httpResponse.data["token"],
        );

        ///Renvoyer la reponse
        return Right(DataSuccess(httpResponse.data));
      } else {
        Logger().e('Response data: ${httpResponse.data}');
        return Left(DataFailed("Une erreur s'est produite"));
      }
    } catch (e) {
      Logger().e(e.toString());
      return Left(DataFailed("Une erreur s'est produite ${e.toString()}"));
    }
  }

  @override
  Future<Either<DataFailed<String>, DataSuccess<ProfilModel>>> verifyEmail({
    required String token,
  }) async {
    try {
      final response = await _registerService.verifyEmail(token: token);

      // Vérification des codes de statut HTTP
      if (response.statusCode == HttpStatus.ok) {
        Logger().i(response.data);

        final profil = ProfilModel.fromJson(response.data);
        return Right(DataSuccess(profil));
      }
      if (response.statusCode == HttpStatus.internalServerError) {
        Logger().f("Erreur 500 ici");
        Logger().e(response.data);
        return Left(
            DataFailed<String>("Une erreur s'est produite sur le serveur"));
      } else {
        return Left(DataFailed("Echec de vérification de l'email"));
      }
    } on DioException catch (e) {
      Logger().e('DioException: ${e.message}');
      // Gestion des erreurs spécifiques
      if (e.response != null) {
        if (e.response?.statusCode == 500) {
          Logger()
              .e('Erreur 500 capturée dans l\'exception: ${e.response?.data}');
          return Left(
              DataFailed<String>("Une erreur s'est produite sur le serveur"));
        }
      }
      // Autres erreurs génériques de Dio
      return Left(DataFailed("Une erreur réseau s'est produite"));
    } catch (e) {
      Logger().e('Erreur inconnue: $e');
      return Left(DataFailed("Une erreur inattendue s'est produite"));
    }
  }

  @override
  Future<Either<DataFailed<String>, DataSuccess<AuthSessionModel>>> authUser(
      {required RegisterUser loginUser}) async {
    try {
      final httpResponse =
          await _registerService.authUser(loginUser: loginUser);
      Logger().i("je debute la requette");
      Logger().i("info response ${httpResponse.data}");
      Logger().i("statut response ${httpResponse.statusCode}");
      if (httpResponse.statusCode == HttpStatus.ok) {
        Logger().i("Un code 200");
        final authSession = AuthSessionModel.fromJson(httpResponse.data);

        /// Sauvegarder le token
        StorageService()
            .saveAuthToken(authSession.accessToken?.authToken ?? "");

        /// Sauvegarder la session
        StorageService().saveAuthSession(authSession);

        return Right(DataSuccess(authSession));
      }

      if (httpResponse.statusCode == HttpStatus.conflict) {
        return Left(DataFailed("Cet utilisateur existe déjâ"));
      }

      return Left(DataFailed("Une erreur s'est produite"));
    } catch (e) {
      Logger().i("Une erreur dans le catch");
      return Left(DataFailed("Une erreur s'est produite"));
    }
  }

  @override
  Future<Either<DataFailed, DataSuccess>> activeBiometric() async {
    try {
      final httpResponse = await _registerService.activeBiometric();
      if (httpResponse.statusCode == HttpStatus.ok) {
        return Right(DataSuccess("Biometric activé"));
      } else {
        return Left(DataFailed("Une erreur s'est produite"));
      }
    } catch (e) {
      return Left(DataFailed("Une erreur s'est produite"));
    }
  }

  @override
  Future<Either<DataFailed<String>, DataSuccess<AuthSessionModel>>> login(
      {required Map<String, dynamic> data}) async {
    try {
      final httpResponse = await _registerService.authenticate(data);
      if (httpResponse.statusCode == HttpStatus.ok) {
        final authSession = AuthSessionModel.fromJson(httpResponse.data);

        /// Sauvegarder le token
        StorageService()
            .saveAuthToken(authSession.accessToken?.authToken ?? "");

        /// Sauvegarder la session
        StorageService().saveAuthSession(authSession);

        return Right(DataSuccess(authSession));
      } else {
        return Left(DataFailed("Code PIN incorrect"));
      }
    } catch (e) {
      Logger().e(e);
      return Left(DataFailed("Une erreur s'est produite"));
    }
  }

  @override
  Future<Either<DataFailed<String>, DataSuccess<dynamic>>>
      changeProfil() async {
    try {
      final httpResponse = await _registerService.changeProfil();
      Logger().e("httpResponse.data");
      if (httpResponse.statusCode == HttpStatus.ok) {
        return Right(DataSuccess(httpResponse.data));
      }
      return Left(DataFailed("Une erreur s'est produite"));
    } catch (e) {
      Logger().e(e);
      return Left(DataFailed("Une erreur s'est produite"));
    }
  }
}
