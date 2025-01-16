import 'package:either_dart/either.dart';
import 'package:kori_etu/core/resources/data_state.dart';
import 'package:kori_etu/core/usecases/usescase.dart';
import 'package:kori_etu/features/register/domain/repository/register_user_repository.dart';

class ActiveBiometricUsecase
    implements Usescase<Either<DataFailed, DataSuccess<dynamic>>, void> {
  final RegisterUserRepository _registerUserRepository;
  ActiveBiometricUsecase(this._registerUserRepository);
  @override
  Future<Either<DataFailed, DataSuccess>> call(params) {
    return _registerUserRepository.activeBiometric();
  }
}
