import 'package:flutter/material.dart';
import 'package:kori_etu/config/theme/style.dart';

class PinIndicators extends StatelessWidget {
  const PinIndicators({super.key, required this.pin});
  final String pin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(6, (index) {
          return Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: kborderColors, width: 1),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: index < pin.length ? kprimary : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: kprimary, width: 2),
              ),
            ),
          );
        }),
      ),
    );
  }
}
