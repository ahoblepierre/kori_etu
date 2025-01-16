import 'package:flutter/material.dart';
import 'package:kori_etu/config/theme/style.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    this.labelButton = "Annuller",
    this.onPressed,
  });
  final String labelButton;

  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(horizontal: .0, vertical: 12.0),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kborder),
            ),
          ),
        ),
        child: Text(
          labelButton,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }
}
