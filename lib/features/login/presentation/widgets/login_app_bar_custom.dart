import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/theme/style.dart';

class LoginAppBarCustom extends StatelessWidget {
  const LoginAppBarCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft04,
            color: Colors.black,
            size: iconSize,
          ),
        ),
        Image.asset("assets/images/kori_logo_text.png"),
      ],
    );
  }
}
