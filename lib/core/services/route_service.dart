import 'package:kori_etu/core/services/storage_service.dart';
import 'package:logger/logger.dart';

class RouteService {
  // Instance unique
  final StorageService storageService;

  // Constructeur privé
  RouteService._(this.storageService);

  static late RouteService? _instance;

  static Future<void> initialize(StorageService storageService) async {
    _instance = RouteService._(storageService);
  }

  static RouteService get instance {
    if (_instance == null) {
      throw Exception("RouteService not initialized");
    }
    return _instance!;
  }

  /// Verifiez si le onboarding a été déja vu
  bool hasSeenOnboarding() {
    Logger()
        .e("hasCompletedOnboarding ${storageService.hasCompletedOnboarding}");
    return storageService.hasCompletedOnboarding;
  }
}
