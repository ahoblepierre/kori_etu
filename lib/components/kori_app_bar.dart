import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';

class KoriAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KoriAppBar({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    /// Screeen size  config
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
      title: Text(
        title ?? "App Bar Title",
        style: koriTextStyle(
          fontWeight: FontWeight.w700,
          fontSize: SizeConfig.blockHorizontal! * 4.5,
        ),
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
