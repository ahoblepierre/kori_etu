class AuthSessionModel {
  AuthSessionModel({
    required this.sessionId,
    required this.accessToken,
    required this.sessionStatus,
    required this.profile,
    required this.platform,
    required this.deviceRef,
    required this.deviceRefId,
    required this.deviceOs,
    required this.ipAddress,
    required this.lastConnected,
  });

  final String? sessionId;
  final AccessToken? accessToken;
  final String? sessionStatus;
  final Profile profile;
  final String? platform;
  final String? deviceRef;
  final String? deviceRefId;
  final String? deviceOs;
  final String? ipAddress;
  final DateTime? lastConnected;

  factory AuthSessionModel.fromJson(Map<String, dynamic> json) {
    return AuthSessionModel(
      sessionId: json["sessionId"],
      accessToken: json["accessToken"] == null
          ? null
          : AccessToken.fromJson(json["accessToken"]),
      sessionStatus: json["sessionStatus"],
      profile:
          json["profile"] = Profile.fromJson(json["profile"]),
      platform: json["platform"],
      deviceRef: json["deviceRef"],
      deviceRefId: json["deviceRefId"],
      deviceOs: json["deviceOs"],
      ipAddress: json["ipAddress"],
      lastConnected: DateTime.tryParse(json["lastConnected"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "sessionId": sessionId,
        "accessToken": accessToken?.toJson(),
        "sessionStatus": sessionStatus,
        "profile": profile.toJson(),
        "platform": platform,
        "deviceRef": deviceRef,
        "deviceRefId": deviceRefId,
        "deviceOs": deviceOs,
        "ipAddress": ipAddress,
        "lastConnected": lastConnected?.toIso8601String(),
      };

  @override
  String toString() {
    return "$sessionId, $accessToken, $sessionStatus, $profile, $platform, $deviceRef, $deviceRefId, $deviceOs, $ipAddress, $lastConnected, ";
  }
}

class AccessToken {
  AccessToken({
    required this.accessId,
    required this.authToken,
    required this.authType,
    required this.tokenDate,
    required this.expirationTime,
    required this.isDesabled,
  });

  final int? accessId;
  final String? authToken;
  final String? authType;
  final DateTime? tokenDate;
  final String? expirationTime;
  final bool? isDesabled;

  factory AccessToken.fromJson(Map<String, dynamic> json) {
    return AccessToken(
      accessId: json["accessId"],
      authToken: json["authToken"],
      authType: json["authType"],
      tokenDate: DateTime.tryParse(json["tokenDate"] ?? ""),
      expirationTime: json["expirationTime"],
      isDesabled: json["isDesabled"],
    );
  }

  Map<String, dynamic> toJson() => {
        "accessId": accessId,
        "authToken": authToken,
        "authType": authType,
        "tokenDate": tokenDate?.toIso8601String(),
        "expirationTime": expirationTime,
        "isDesabled": isDesabled,
      };

  @override
  String toString() {
    return "$accessId, $authToken, $authType, $tokenDate, $expirationTime, $isDesabled, ";
  }
}

class Profile {
  Profile({
    required this.profileId,
    required this.currency,
    required this.enabled,
    required this.enabledDate,
    required this.isProfileStudent,
    required this.user,
  });

  final int? profileId;
  final String? currency;
  final bool enabled;
  final DateTime? enabledDate;
  final bool? isProfileStudent;
  final User? user;

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      profileId: json["profileId"],
      currency: json["currency"],
      enabled: json["enabled"],
      enabledDate: DateTime.tryParse(json["enabledDate"] ?? ""),
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      isProfileStudent: json["isProfileStudent"]?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "profileId": profileId,
        "currency": currency,
        "enabled": enabled,
        "enabledDate": enabledDate?.toIso8601String(),
        "user": user?.toJson(),
        "isProfileStudent": isProfileStudent,
      };

  @override
  String toString() {
    return "$profileId, $currency, $enabled, $enabledDate, $isProfileStudent, $user, ";
  }
}

class User {
  User({
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
}
