import 'package:kori_etu/features/register/domain/entities/profil_entity.dart';

class ProfilModel extends ProfilEntity {
  const ProfilModel({
    required super.profileId,
    required super.currency,
    required super.enabled,
    required super.enabledDate,
    required super.isProfileStudent,
    required super.profileStudentEnabledAt,
    required super.isBiometricsActive,
    required super.biometricsEnabledAt,
    required super.threshold,
    required super.user,
  });

  factory ProfilModel.fromJson(Map<String, dynamic> json) {
    return ProfilModel(
      profileId: json['profileId'] ?? 0,
      currency: json['currency'] ?? "",
      enabled: json['enabled'],
      enabledDate: json['enabledDate'] == null
          ? null
          : DateTime.tryParse(json['enabledDate']),
      isProfileStudent: json['isProfileStudent'] ?? false,
      profileStudentEnabledAt: json['profileStudentEnabledAt'] == null
          ? null
          : DateTime.tryParse(json['profileStudentEnabledAt']),
      isBiometricsActive: json['isBiometricsActive'],
      biometricsEnabledAt: json['biometricsEnabledAt'] == null
          ? null
          : DateTime.tryParse(json['biometricsEnabledAt']),
      threshold: json['threshold'],
      user: User.fromJson(json['user']),
    );
  }
}
