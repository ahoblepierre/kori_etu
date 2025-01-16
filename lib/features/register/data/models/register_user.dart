// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterUser {
  final String email;
  final String targetUrl;
  final String platform;
  final String deviceRef;
  final String deviceRefId;
  final String deviceOs;
  final String ipAddress;
  final String country;
  final String? password;

  RegisterUser({
    required this.email,
    required this.targetUrl,
    required this.platform,
    required this.deviceRef,
    required this.deviceRefId,
    required this.deviceOs,
    required this.ipAddress,
    required this.country,
    this.password,
  });

  RegisterUser copyWith({
    String? email,
    String? targetUrl,
    String? platform,
    String? deviceRef,
    String? deviceRefId,
    String? deviceOs,
    String? ipAddress,
    String? country,
    String? password,
  }) =>
      RegisterUser(
        email: email ?? this.email,
        targetUrl: targetUrl ?? this.targetUrl,
        platform: platform ?? this.platform,
        deviceRef: deviceRef ?? this.deviceRef,
        deviceRefId: deviceRefId ?? this.deviceRefId,
        deviceOs: deviceOs ?? this.deviceOs,
        ipAddress: ipAddress ?? this.ipAddress,
        country: country ?? this.country,
        password: password ?? this.password,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'targetUrl': targetUrl,
      'platform': platform,
      'deviceRef': deviceRef,
      'deviceRefId': deviceRefId,
      'deviceOs': deviceOs,
      'ipAddress': ipAddress,
      'country': country,
      'password': password,
    };
  }

  factory RegisterUser.fromMap(Map<String, dynamic> map) {
    return RegisterUser(
      email: map['email'],
      targetUrl: map['targetUrl'],
      platform: map['platform'],
      deviceRef: map['deviceRef'],
      deviceRefId: map['deviceRefId'],
      deviceOs: map['deviceOs'],
      ipAddress: map['ipAddress'],
      country: map['country'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUser.fromJson(Map<String, dynamic> source) =>
      RegisterUser.fromMap(source);

  @override
  String toString() {
    return 'RegisterUser(email: $email, targetUrl: $targetUrl, platform: $platform, deviceRef: $deviceRef, deviceRefId: $deviceRefId, deviceOs: $deviceOs, ipAddress: $ipAddress, country: $country)';
  }
}
