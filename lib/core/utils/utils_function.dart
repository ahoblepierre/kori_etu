import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

import 'package:flutter/services.dart';
import 'package:kori_etu/core/resources/devce_info.dart';
import 'package:url_launcher/url_launcher.dart';

bool isString(String input) {
  final stringRegex = RegExp(r'^[a-zA-Z\s]+$');
  return stringRegex.hasMatch(input);
}

bool isInt(String input) {
  final intRegex = RegExp(r'^\d+$');
  return intRegex.hasMatch(input);
}

Future<DeviceInfo> getDevicesInfo() async {
  try {
    final devicesInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await devicesInfoPlugin.androidInfo;
      return DeviceInfo(
        model: androidInfo.model + androidInfo.brand,
        osName: androidInfo.version.release,
        manufacturer: androidInfo.manufacturer,
        device: androidInfo.serialNumber,
        deviceId: androidInfo.id,
        platform: "Téléphone Android",
      );
    } else {
      final iosInfo = await devicesInfoPlugin.iosInfo;
      return DeviceInfo(
        model: iosInfo.model,
        osName: iosInfo.systemName,
        manufacturer: iosInfo.systemName,
        device: iosInfo.name,
        deviceId: iosInfo.identifierForVendor ?? "",
        platform: "Téléphone IOS",
      );
    }
  } on PlatformException catch (e) {
    throw PlatformException(code: "200", message: e.toString());
  }
}

/// Open default email app
void launchEmailApp() async {
  final Uri params = Uri(
    scheme: 'mailto',
  );
  if (await canLaunchUrl(params)) {
    await launchUrl(
      params,
      mode: LaunchMode.externalApplication,
    );
  } else {
    throw 'Could not launch $launchUrl';
  }
}

/// Custom TextInputFormatter for credit card number formatting
class CreditCardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove all non-digit characters
    String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Format as XXXX XXXX XXXX XXXX
    String formatted = '';
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i > 0 && i % 4 == 0) {
        formatted += ' ';
      }
      formatted += digitsOnly[i];
    }

    // Maintain cursor position
    int cursorPosition = formatted.length;
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}

double addOnePercent(dynamic amount) {
  // Vérifier si amount est une String et tenter de la convertir en double
  if (amount is String) {
    amount = double.tryParse(amount);
    if (amount == null) {
      throw ArgumentError("Le montant doit être un nombre valide.");
    }
  }

  // Vérifier si amount est bien un double après conversion
  if (amount is! double) {
    throw ArgumentError(
        "Le montant doit être un nombre (double) ou une chaîne convertible en nombre.");
  }

  return amount + (amount * 0.01);
}
