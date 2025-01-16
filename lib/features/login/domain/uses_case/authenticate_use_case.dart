import 'package:either_dart/either.dart';
import 'package:kori_etu/core/resources/data_state.dart';
import 'package:kori_etu/core/usecases/usescase.dart';
import 'package:kori_etu/features/login/data/model/auth_session_model.dart';
import 'package:kori_etu/features/register/domain/repository/register_user_repository.dart';

class AuthenticateUseCase
    implements
        Usescase<Either<DataFailed<String>, DataSuccess<AuthSessionModel>>,
            Map<String, dynamic>> {
  final RegisterUserRepository _registerUserRepository;
  AuthenticateUseCase(this._registerUserRepository);

  @override
  Future<Either<DataFailed<String>, DataSuccess<AuthSessionModel>>> call(
    Map<String, dynamic> params,
  ) {
    return _registerUserRepository.login(data: params);
  }
}
