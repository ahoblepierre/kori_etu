import 'package:flutter/material.dart';
import 'package:kori_etu/config/theme/style.dart';

class KoriCircularProgressIndicator extends StatelessWidget {
  const KoriCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.scale(
          scale: 5,
          child: const CircularProgressIndicator(
            strokeWidth: 0.5,
            valueColor: AlwaysStoppedAnimation<Color>(kprimary),
          ),
        ),
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.transparent,
          child: Image.asset(
            'assets/images/kori_logo_text.png', // Assurez-vous que l'image est dans le dossier assets
            width: 250,
            height: 250,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}