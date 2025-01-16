import 'package:either_dart/either.dart';
import 'package:kori_etu/core/resources/data_state.dart';
import 'package:kori_etu/core/usecases/usescase.dart';
import 'package:kori_etu/features/register/domain/repository/register_user_repository.dart';

class ChangeProfilUsecase
    implements
        Usescase<Either<DataFailed<String>, DataSuccess<dynamic>>,
            void> {
  final RegisterUserRepository _registerUserRepository;
  ChangeProfilUsecase(this._registerUserRepository);
  @override
  Future<Either<DataFailed<String>, DataSuccess<dynamic>>> call(
      void params) {
    return _registerUserRepository.changeProfil();
  }
}
