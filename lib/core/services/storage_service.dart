import 'package:get_storage/get_storage.dart';
import 'package:kori_etu/core/constants/constants.dart';
import 'package:kori_etu/features/login/data/model/auth_session_model.dart';

class StorageService {
  // GetStorage instance
  final GetStorage _box = GetStorage();

  // Si l'écran d'onboarding a déjà été vu
  bool get hasCompletedOnboarding =>
      _box.read<bool>(hasSeenOnboarding) ?? false;

  // Marquer l'onboarding comme complété
  void setCompletedOnboarding() => _box.write(hasSeenOnboarding, true);

  /// recuperer le token de l'utilisateur
  String get authToken => _box.read<String>(jwtToken) ?? "";

  /// Sauvegarder le token de l'utilisateur
  void saveAuthToken(String token) => _box.write(jwtToken, token);

  /// Sauvegarder la sessionde l'utilisateur
  void saveAuthSession(AuthSessionModel userSession) =>
      _box.write(authSession, userSession.toJson());

  /// Recupere l'utilisateur en session
  AuthSessionModel? get getAuthSession {
    final map = _box.read(authSession); // Lire les données sans type spécifique
    if (map != null && map is Map<String, dynamic>) {
      // Convertir en AuthSessionModel si c'est un Map<String, dynamic>
      return AuthSessionModel.fromJson(map);
    }
    return null;
  }

  /// set biometrie
  void setBiometricIsActif() => _box.write(biometrieActif, true);

  /// get biometrie
  bool get getBiometrieIsActif => _box.read<bool>(biometrieActif) ?? false;

  /// S'il s'est déja connecté
  bool get isAuthenticated => _box.read<bool>(isAuthenticate) ?? false;

  /// Setter pour s'authentifier
  void setIsAuthenticated() => _box.write(isAuthenticate, true);

  /// Setter pour déconnecter
  void setIsNotAuthenticated() => _box.write(isAuthenticate, false);

  /// setIsDateNowToLogin
  void setIsDateNowToLogin() => _box.write(isDateNowisLogin,
      DateTime.now().add(const Duration(minutes: 5)).toIso8601String());

  /// Get isDateOlderThan5Minutes
  bool get isDateOlderThan5Minutes {
    String? olderDate = getCache<String>(isDateNowisLogin);
    if (olderDate == null) return false;
    DateTime storedDate = DateTime.parse(olderDate);
    return (DateTime.now().difference(storedDate)).inMinutes > 5;
  }

  /// Getter générique pour récupérer une valeur du cache
  T? getCache<T>(String key) => _box.read<T>(key);

  ///Setter Ecrire dans le cache
  void setCache<T>(String key, T value) => _box.write(key, value);

  /// remove a specific cache
  void removeCache(String key) => _box.remove(key);

  /// remove all cache
  void removeAllCache() => _box.erase();
}
