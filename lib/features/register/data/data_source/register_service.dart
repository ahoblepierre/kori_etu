import 'package:dio/dio.dart';
import 'package:kori_etu/core/constants/constants.dart';
import 'package:kori_etu/core/resources/http_client.dart';
import 'package:kori_etu/features/register/data/models/register_user.dart';

class RegisterService {
  final HttpClient _httpClient;

  RegisterService(this._httpClient);
  Future<Response> register({required RegisterUser registerUser}) {
    return _httpClient.post(
      "$appBaseUrl/auth/request",
      data: registerUser.toJson(),
    );
  }

  Future<Response> verifyEmail({required String token}) {
    return _httpClient.post(
      "$appBaseUrl/auth/verifier",
      data: {"jwt": token},
    );
  }

  Future<Response> authUser({required RegisterUser loginUser}) {
    return _httpClient.post(
      "$appBaseUrl/account/enable",
      data: {"username": loginUser.email, "password": loginUser.password},
    );
  }

  Future<Response> activeBiometric() async {
    return _httpClient.put(
      "$appBaseUrl/biometrics/enable",
      options: Options(extra: {"requiresToken": true}),
    );
  }

  Future<Response> authenticate(Map<String, dynamic> data) async {
    return _httpClient.post("$appBaseUrl/account/login", data: data);
  }

  Future<Response> changeProfil() async {
    return _httpClient.put(
      "$appBaseUrl/student/enable",
      options: Options(extra: {"requiresToken": true}),
    );
  }
}
