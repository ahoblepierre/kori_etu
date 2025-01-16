import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/components/secondary_button.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/resources/scaffold_message_enum.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

bool validateEmail(String email) {
  String pattern =
      r'^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})+$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}

MaskTextInputFormatter generatePhoneFormatter({required int maxLength}) {
  String mask = '';
  int remainingDigits = maxLength;

  while (remainingDigits > 0) {
    if (remainingDigits > 3) {
      mask += '### '; // Ajouter un groupe de trois chiffres
      remainingDigits -= 3;
    } else if (remainingDigits > 2) {
      mask += '## '; // Ajouter un groupe de deux chiffres
      remainingDigits -= 2;
    } else {
      mask += '##'; // Ajouter les derniers chiffres sans espace
      remainingDigits -= 2;
    }
  }

  // Retirer l'espace final si présent
  if (mask.endsWith(' ')) {
    mask = mask.substring(0, mask.length - 1);
  }

  return MaskTextInputFormatter(
    mask: mask,
    filter: {"#": RegExp(r'[0-9]')},
  );
}

Future<void> koriDialog(
  BuildContext context, {
  required double height,
  required String title,
  required String subtitle,
  required String actionText,
  required String cancellText,
  required Function()? onSubmit,
  Function()? onDismiss,
}) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kborder)), //this right here
          child: Container(
            padding: const EdgeInsets.all(12.0),
            height: height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: koriTextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  subtitle,
                  style: koriTextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: SecondaryButton(
                        labelButton: cancellText,
                        onPressed:
                            onDismiss ?? () => Navigator.of(context).pop(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: PrimaryButton(
                      labelButton: actionText,
                      onPressed: onSubmit,
                    )),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

Color getBackgroundColor(Statut statut) {
  switch (statut) {
    case Statut.ERROR:
      return Colors.red[200]!;
    case Statut.WARNING:
      return Colors.orange[200]!;
    case Statut.INFO:
      return Colors.blue[200]!;
    default:
      return Colors.green[200]!;
  }
}

Color getTextColor(Statut statut) {
  switch (statut) {
    case Statut.ERROR:
      return Colors.red[800]!;
    case Statut.WARNING:
      return Colors.orange[800]!;
    case Statut.INFO:
      return Colors.blue[800]!;
    default:
      return Colors.green[800]!;
  }
}

Widget getIcon(Statut statut) {
  switch (statut) {
    case Statut.ERROR:
      return HugeIcon(
        icon: HugeIcons.strokeRoundedCancelCircle,
        color: getTextColor(statut),
        size: 30.0,
      );
    case Statut.WARNING:
      return HugeIcon(
        icon: HugeIcons.strokeRoundedAlert01,
        color: getTextColor(statut),
        size: 30.0,
      );
    case Statut.INFO:
      return HugeIcon(
        icon: HugeIcons.strokeRoundedInformationCircle,
        color: getTextColor(statut),
        size: 30.0,
      );
    default:
      return HugeIcon(
        icon: HugeIcons.strokeRoundedCheckmarkCircle01,
        color: getTextColor(statut),
        size: 30.0,
      );
  }
}

/// Scaffold Message
void koriScaffoldMessage(
  BuildContext context,
  String message, {
  Statut statut = Statut.SUCCESS,
  Position position = Position.TOP,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: getBackgroundColor(statut),
    elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kborder)),
    behavior: SnackBarBehavior.floating,
    margin: position == Position.TOP
        ? EdgeInsets.only(
            bottom: MediaQuery.sizeOf(context).height * 0.80,
            left: kespacingScaffoldMessage,
            right: kespacingScaffoldMessage,
          )
        : const EdgeInsets.all(kespacingScaffoldMessage),
    content: FadeScaleTransition(
      animation: const AlwaysStoppedAnimation(1.0),
      child: Padding(
        padding: const EdgeInsets.all(kespacingScaffoldMessage),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getIcon(statut),
            const SizedBox(width: kborder),
            Flexible(
              flex: 8,
              child: Text(
                message,
                style: koriTextStyle(
                  color: getTextColor(statut),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    duration: const Duration(seconds: 5),
    // action: SnackBarAction(
    //   label: 'ACTION',
    //   onPressed: () {},
    // ),
  ));
}



