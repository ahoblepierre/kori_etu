import 'package:flutter/material.dart';
import 'package:kori_etu/config/theme/style.dart';

class DiseableButton extends StatelessWidget {
  const DiseableButton({
    super.key,
    required this.labelButton,
    required this.textStyle,
  });

  final String labelButton;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: .0, vertical: 12.0),
      decoration: BoxDecoration(
        color: kprimary.withOpacity(0.5),
        borderRadius: BorderRadius.circular(kborder),
      ),
      child: Center(
        child: Text(
          labelButton,
          style: textStyle ??
              const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17.0,
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}