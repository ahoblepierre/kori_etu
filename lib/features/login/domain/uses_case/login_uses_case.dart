import 'package:either_dart/either.dart';
import 'package:kori_etu/core/resources/data_state.dart';
import 'package:kori_etu/core/usecases/usescase.dart';
import 'package:kori_etu/features/login/data/model/auth_session_model.dart';
import 'package:kori_etu/features/register/data/models/register_user.dart';
import 'package:kori_etu/features/register/domain/repository/register_user_repository.dart';

class LoginUsesCase
    implements
        Usescase<Either<DataFailed<String>, DataSuccess<AuthSessionModel>>,
            RegisterUser> {
  final RegisterUserRepository _registerUserRepository;

  LoginUsesCase(this._registerUserRepository);

  @override
  Future<Either<DataFailed<String>, DataSuccess<AuthSessionModel>>> call(
    RegisterUser loginUser,
  ) {
    return _registerUserRepository.authUser(loginUser: loginUser);
  }
}
