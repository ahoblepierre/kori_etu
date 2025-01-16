import 'package:flutter/material.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.5),
      decoration: BoxDecoration(
        color: kprimary.withOpacity(0.5),
        borderRadius: BorderRadius.circular(kborder),
      ),
      child: Center(
        child: Transform.scale(
          scale: 0.7,
          child: LoadingAnimationWidget.threeArchedCircle(
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
