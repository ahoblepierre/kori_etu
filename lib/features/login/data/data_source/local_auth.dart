import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:logger/logger.dart';

class LocalAuth {
  static bool _supportedState = false;

  late final LocalAuthentication authentication;

  get supportedState => _supportedState;

  /// Initialisation  pour detecter si le telephone utilise le local Authentication
  Future<void> initDevice() async {
    authentication = LocalAuthentication();
    authentication.isDeviceSupported().then((bool isSupported) {
      _supportedState = isSupported;
    });
  }

  Future<bool> isSupported() async {
    authentication = LocalAuthentication();
    return authentication.isDeviceSupported();
  }

  /// get parameters available biometrics
  Future<List<BiometricType>> getAvailableBiometrics() async {
    if (_supportedState) {
      return authentication.getAvailableBiometrics();
    } else {
      throw Exception('Device not supported for biometric authentication');
    }
  }

  /// authenticate user with specified faceid or emprunt
  Future<bool> authenticate() async {
    try {
      bool authenticated = await authentication.authenticate(
          localizedReason: "Appuyez sur le lecteur d'emprunte digitale",
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
          ));
      return authenticated;
    } on PlatformException catch (e) {
      Logger().e(e.message);
      throw PlatformException(message: e.message, code: "200");
    }
  }
}
