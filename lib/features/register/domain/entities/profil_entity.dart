import 'package:equatable/equatable.dart';

class ProfilEntity extends Equatable {
  const ProfilEntity({
    required this.profileId,
    required this.currency,
    required this.enabled,
    required this.enabledDate,
    required this.isProfileStudent,
    required this.profileStudentEnabledAt,
    required this.isBiometricsActive,
    required this.biometricsEnabledAt,
    required this.threshold,
    required this.user,
  });

  final int? profileId;
  final String? currency;
  final bool enabled;
  final DateTime? enabledDate;
  final bool? isProfileStudent;
  final DateTime? profileStudentEnabledAt;
  final bool? isBiometricsActive;
  final DateTime? biometricsEnabledAt;
  final Threshold? threshold;
  final User? user;

  ProfilEntity copyWith({
    int? profileId,
    String? currency,
    bool? enabled,
    DateTime? enabledDate,
    bool? isProfileStudent,
    DateTime? profileStudentEnabledAt,
    bool? isBiometricsActive,
    DateTime? biometricsEnabledAt,
    Threshold? threshold,
    User? user,
  }) {
    return ProfilEntity(
      profileId: profileId ?? this.profileId,
      currency: currency ?? this.currency,
      enabled: enabled ?? this.enabled,
      enabledDate: enabledDate ?? this.enabledDate,
      isProfileStudent: isProfileStudent ?? this.isProfileStudent,
      profileStudentEnabledAt:
          profileStudentEnabledAt ?? this.profileStudentEnabledAt,
      isBiometricsActive: isBiometricsActive ?? this.isBiometricsActive,
      biometricsEnabledAt: biometricsEnabledAt ?? this.biometricsEnabledAt,
      threshold: threshold ?? this.threshold,
      user: user ?? this.user,
    );
  }

  factory ProfilEntity.fromJson(Map<String, dynamic> json) {
    return ProfilEntity(
      profileId: json["profileId"],
      currency: json["currency"],
      enabled: json["enabled"],
      enabledDate: DateTime.tryParse(json["enabledDate"] ?? ""),
      isProfileStudent: json["isProfileStudent"],
      profileStudentEnabledAt:
          DateTime.tryParse(json["profileStudentEnabledAt"] ?? ""),
      isBiometricsActive: json["isBiometricsActive"],
      biometricsEnabledAt: DateTime.tryParse(json["biometricsEnabledAt"] ?? ""),
      threshold: json["threshold"] == null
          ? null
          : Threshold.fromJson(json["threshold"]),
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "profileId": profileId,
        "currency": currency,
        "enabled": enabled,
        "enabledDate": enabledDate?.toIso8601String(),
        "isProfileStudent": isProfileStudent,
        "profileStudentEnabledAt": profileStudentEnabledAt?.toIso8601String(),
        "isBiometricsActive": isBiometricsActive,
        "biometricsEnabledAt": biometricsEnabledAt?.toIso8601String(),
        "threshold": threshold?.toJson(),
        "user": user?.toJson(),
      };

  @override
  String toString() {
    return "$profileId, $currency, $enabled, ";
  }

  @override
  List<Object?> get props => [
        profileId,
        currency,
        enabled,
        enabledDate,
        isProfileStudent,
        profileStudentEnabledAt,
        isBiometricsActive,
        biometricsEnabledAt,
        threshold,
        user,
      ];
}

class Threshold extends Equatable {
  const Threshold({
    required this.thresholdId,
    required this.transactionThreshold,
    required this.transactionThresholdCumul,
    required this.thresholdCumulResetReriod,
    required this.profileId,
  });

  final int? thresholdId;
  final String? transactionThreshold;
  final String? transactionThresholdCumul;
  final int? thresholdCumulResetReriod;
  final int? profileId;

  Threshold copyWith({
    int? thresholdId,
    String? transactionThreshold,
    String? transactionThresholdCumul,
    int? thresholdCumulResetReriod,
    int? profileId,
  }) {
    return Threshold(
      thresholdId: thresholdId ?? this.thresholdId,
      transactionThreshold: transactionThreshold ?? this.transactionThreshold,
      transactionThresholdCumul:
          transactionThresholdCumul ?? this.transactionThresholdCumul,
      thresholdCumulResetReriod:
          thresholdCumulResetReriod ?? this.thresholdCumulResetReriod,
      profileId: profileId ?? this.profileId,
    );
  }

  factory Threshold.fromJson(Map<String, dynamic> json) {
    return Threshold(
      thresholdId: json["thresholdId"],
      transactionThreshold: json["transactionThreshold"],
      transactionThresholdCumul: json["transactionThresholdCumul"],
      thresholdCumulResetReriod: json["thresholdCumulResetReriod"],
      profileId: json["profileId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "thresholdId": thresholdId,
        "transactionThreshold": transactionThreshold,
        "transactionThresholdCumul": transactionThresholdCumul,
        "thresholdCumulResetReriod": thresholdCumulResetReriod,
        "profileId": profileId,
      };

  @override
  String toString() {
    return "$thresholdId, $transactionThreshold, $transactionThresholdCumul, $thresholdCumulResetReriod, $profileId, ";
  }

  @override
  List<Object?> get props => [
        thresholdId,
        transactionThreshold,
        transactionThresholdCumul,
        thresholdCumulResetReriod,
        profileId,
      ];
}

class User extends Equatable {
  const User({
    required this.userId,
    required this.lastname,
    required this.firstname,
    required this.gender,
    required this.civility,
    required this.photo,
    required this.country,
    required this.countryCode,
    required this.city,
    required this.mobile,
    required this.email,
    required this.profession,
    required this.role,
    required this.status,
    required this.createdOn,
    required this.updatedOn,
  });

  final int? userId;
  final String? lastname;
  final String? firstname;
  final String? gender;
  final String? civility;
  final String? photo;
  final String? country;
  final String? countryCode;
  final String? city;
  final String? mobile;
  final String? email;
  final String? profession;
  final String? role;
  final String? status;
  final DateTime? createdOn;
  final DateTime? updatedOn;

  User copyWith({
    int? userId,
    String? lastname,
    String? firstname,
    String? gender,
    String? civility,
    String? photo,
    String? country,
    String? countryCode,
    String? city,
    String? mobile,
    String? email,
    String? profession,
    String? role,
    String? status,
    DateTime? createdOn,
    DateTime? updatedOn,
  }) {
    return User(
      userId: userId ?? this.userId,
      lastname: lastname ?? this.lastname,
      firstname: firstname ?? this.firstname,
      gender: gender ?? this.gender,
      civility: civility ?? this.civility,
      photo: photo ?? this.photo,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      city: city ?? this.city,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      profession: profession ?? this.profession,
      role: role ?? this.role,
      status: status ?? this.status,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json["userId"],
      lastname: json["lastname"],
      firstname: json["firstname"],
      gender: json["gender"],
      civility: json["civility"],
      photo: json["photo"],
      country: json["country"],
      countryCode: json["countryCode"],
      city: json["city"],
      mobile: json["mobile"],
      email: json["email"],
      profession: json["profession"],
      role: json["role"],
      status: json["status"],
      createdOn: DateTime.tryParse(json["createdOn"] ?? ""),
      updatedOn: DateTime.tryParse(json["updatedOn"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "lastname": lastname,
        "firstname": firstname,
        "gender": gender,
        "civility": civility,
        "photo": photo,
        "country": country,
        "countryCode": countryCode,
        "city": city,
        "mobile": mobile,
        "email": email,
        "profession": profession,
        "role": role,
        "status": status,
        "createdOn": createdOn?.toIso8601String(),
        "updatedOn": updatedOn?.toIso8601String(),
      };

  @override
  String toString() {
    return "$userId, $lastname, $firstname, $gender, $civility, $photo, $country, $countryCode, $city, $mobile, $email, $profession, $role, $status, $createdOn, $updatedOn, ";
  }

  @override
  List<Object?> get props => [
        userId,
        lastname,
        firstname,
        gender,
        civility,
        photo,
        country,
        countryCode,
        city,
        mobile,
        email,
        profession,
        role,
        status,
        createdOn,
        updatedOn,
      ];
}
