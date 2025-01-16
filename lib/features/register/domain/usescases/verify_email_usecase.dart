import 'package:either_dart/either.dart';
import 'package:kori_etu/core/resources/data_state.dart';
import 'package:kori_etu/core/usecases/usescase.dart';
import 'package:kori_etu/features/register/domain/entities/profil_entity.dart';
import 'package:kori_etu/features/register/domain/repository/register_user_repository.dart';

class VerifyEmailUseCase
    implements Usescase<Either<DataFailed, DataSuccess<dynamic>>, String> {
  final RegisterUserRepository _registerUserRepository;
  VerifyEmailUseCase(this._registerUserRepository);

  @override
  Future<Either<DataFailed<String>, DataSuccess<ProfilEntity>>> call(
    String params,
  ) {
    return _registerUserRepository.verifyEmail(token: params);
  }
}
