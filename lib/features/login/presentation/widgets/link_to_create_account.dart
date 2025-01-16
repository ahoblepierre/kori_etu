import 'package:flutter/material.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';

class LinkToCreateAccount extends StatelessWidget {
  const LinkToCreateAccount({
    super.key,
    this.onTap,
    required this.firstText,
    required this.secondText,
  });
  final void Function()? onTap;

  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: RichText(
            text: TextSpan(
          style: TextStyle(
            color: Colors.grey[500],
            fontFamily: ksecondFont,
            fontWeight: FontWeight.w400,
          ),
          children: <TextSpan>[
            TextSpan(
              text: firstText,
              style: TextStyle(
                color: Colors.grey[400],
                fontFamily: ksecondFont,
                fontSize: SizeConfig.blockVertical! * 1.6,
              ),
            ),
            TextSpan(
              text: secondText,
              style: TextStyle(
                color: kprimary,
                fontFamily: ksecondFont,
                fontWeight: FontWeight.w400,
                fontSize: SizeConfig.blockVertical! * 1.6,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
