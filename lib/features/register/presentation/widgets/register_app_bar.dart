import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';

class RegisterAppBar extends StatelessWidget {
  const RegisterAppBar({
    super.key,
    this.time = 0.2,
  });

  final double? time;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedSquareArrowLeft01,
            color: kprimary,
            size: SizeConfig.blockHorizontal! * 8,
          ),
        ),
        const SizedBox(width: kborder),
        Flexible(
          flex: 2,
          child: LinearProgressIndicator(
            value: time,
            backgroundColor: kgrey,
            valueColor: const AlwaysStoppedAnimation<Color>(kprimary),
            borderRadius: BorderRadius.circular(kborder),
          ),
        )
      ],
    );
  }
}
