import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';

class KoriGraduateAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const KoriGraduateAppBar({
    super.key,
    this.grade,
  });

  final double? grade;

  @override
  Widget build(BuildContext context) {
    /// confi size
    SizeConfig().init(context);

    return AppBar(
      backgroundColor: kscaffoldBackgroundColor,
      leading: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          HugeIcons.strokeRoundedArrowLeft01,
          color: Colors.black,
        ),
      ),
      title: LinearProgressIndicator(
        value: grade ?? 0.0,
        backgroundColor: kgrey,
        valueColor: const AlwaysStoppedAnimation<Color>(kprimary),
        borderRadius: BorderRadius.circular(kborder),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(
        SizeConfig.screenWidth!,
        SizeConfig.blockVertical! * 5.5,
      );
}
