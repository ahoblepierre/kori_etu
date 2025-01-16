import 'package:flutter/material.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class KoriLoading extends StatelessWidget {
  const KoriLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle(
        color: kprimary,
        size: 40,
      ),
    );
  }
}
