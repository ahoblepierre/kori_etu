import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/theme/style.dart';

class KoriButtonIcon extends StatelessWidget {
  const KoriButtonIcon({
    super.key,
    required this.labelText,
    required this.onPressed,
    required this.icon,
    this.color,
  });
  final String labelText;
  final VoidCallback onPressed;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text(
        labelText,
        style: koriTextStyle(fontWeight: FontWeight.normal),
      ),
      icon: HugeIcon(
        icon: icon,
        color: color ?? Colors.black,
        size: 20.0,
      ),
      style: ButtonStyle(
          elevation: WidgetStateProperty.all<double>(5.0),
          padding: WidgetStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(horizontal: kborder, vertical: 12.0),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(Colors.yellow),
          shape: WidgetStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kborder),
              side: BorderSide(color: color ?? Colors.black),
            ),
          )),
    );
  }
}
