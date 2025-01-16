import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/theme/style.dart';

// ignore: must_be_immutable
class OnboardingIcoButton extends StatelessWidget {
  OnboardingIcoButton({
    super.key,
    this.isColor = false,
    this.onPressed,
    this.icon,
  });

  final bool isColor;
  void Function()? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(kborder),
      icon: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: isColor ? ksecondary : Colors.transparent,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: Colors.white),
          ),
          child: Icon(
            icon ?? HugeIcons.strokeRoundedArrowRight01,
            color: isColor ? kprimary : Colors.white,
          )),
      color: Colors.white,
    );
  }
}
