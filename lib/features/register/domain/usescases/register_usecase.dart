import 'package:either_dart/either.dart';
import 'package:kori_etu/core/resources/data_state.dart';
import 'package:kori_etu/core/usecases/usescase.dart';
import 'package:kori_etu/features/register/data/models/register_user.dart';
import 'package:kori_etu/features/register/domain/repository/register_user_repository.dart';

class RegisterUsecase
    implements Usescase<Either<DataFailed, DataSuccess<dynamic>>, RegisterUser> {
  final RegisterUserRepository _registerUserRepository;
  RegisterUsecase(this._registerUserRepository);
  @override
  Future<Either<DataFailed, DataSuccess<dynamic>>> call(RegisterUser params) {
    return _registerUserRepository.register(registerUser: params);
  }
}
