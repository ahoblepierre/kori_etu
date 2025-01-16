import 'package:flutter/material.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kespacing),
      child: Row(
        children: [
          Image.asset(
            "assets/images/royaume-uni.png",
            width: SizeConfig.blockHorizontal! * 10,
            height: SizeConfig.blockHorizontal! * 5,
          ),
          Text(
            "EN",
            style: koriTextStyle(
              color: color ?? Colors.black,
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
