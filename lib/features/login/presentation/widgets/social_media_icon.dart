import 'package:flutter/material.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
              height: SizeConfig.blockHorizontal! * 12.5,
              padding: const EdgeInsets.all(kespacing),
              decoration: BoxDecoration(
                border: Border.all(color: kgrey),
                borderRadius: BorderRadius.circular(kborder),
              ),
              child: Image.asset("assets/images/google_logo.png")),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
              height: SizeConfig.blockHorizontal! * 12.5,
              padding: const EdgeInsets.all(kespacing),
              decoration: BoxDecoration(
                border: Border.all(color: kgrey),
                borderRadius: BorderRadius.circular(kborder),
              ),
              child: Image.asset("assets/images/apple.png")),
        ),
      ],
    );
  }
}
