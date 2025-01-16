import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';

class ParentDashboardAppBar extends StatelessWidget {
  const ParentDashboardAppBar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            HugeIcons.strokeRoundedArrowLeft01,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        Text(
          title,
          style: koriTextStyle(
            fontWeight: FontWeight.w700,
            fontSize: SizeConfig.blockHorizontal! * 4.5,
          ),
        ),
        const Spacer(),
        // const HugeIcon(
        //   icon: HugeIcons.strokeRoundedMoreVerticalCircle01,
        //   color: Colors.black,
        //   size: 24.0,
        // )
      ],
    );
  }
}
