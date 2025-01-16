import 'package:either_dart/either.dart';
import 'package:kori_etu/core/resources/data_state.dart';
import 'package:kori_etu/features/login/data/model/auth_session_model.dart';
import 'package:kori_etu/features/register/data/models/register_user.dart';
import 'package:kori_etu/features/register/domain/entities/profil_entity.dart';

abstract class RegisterUserRepository {
  Future<Either<DataFailed, DataSuccess<dynamic>>> register(
      {required RegisterUser registerUser});

  Future<Either<DataFailed<String>, DataSuccess<ProfilEntity>>> verifyEmail(
      {required String token});

  Future<Either<DataFailed<String>, DataSuccess<AuthSessionModel>>> authUser(
      {required RegisterUser loginUser});

  Future<Either<DataFailed, DataSuccess<dynamic>>> activeBiometric();

  Future<Either<DataFailed<String>, DataSuccess<AuthSessionModel>>> login(
      {required Map<String, dynamic> data});

  Future<Either<DataFailed<String>, DataSuccess<dynamic>>> changeProfil();
}
