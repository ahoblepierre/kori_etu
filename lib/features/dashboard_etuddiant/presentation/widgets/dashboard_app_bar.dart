import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';

/// Dashboard App bar for user
class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kborder),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// User icon + user info name and email
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Icon
              HugeIcon(
                icon: HugeIcons.strokeRoundedUserCircle,
                color: Colors.grey,
                size: SizeConfig.blockHorizontal! * 12,
              ),
              SizedBox(width: SizeConfig.blockHorizontal! * 2.0),

              /// User info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pierre AHOBLE",
                    style: koriTextStyle(
                      fontSize: SizeConfig.blockHorizontal! * 5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "pierredev.ahoble.com",
                    style: koriTextStyle(
                      fontSize: SizeConfig.blockHorizontal! * 3.5,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              )
            ],
          ),

          /// notifications icon
          Container(
            padding: EdgeInsets.all(SizeConfig.blockHorizontal! * 2.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.5),
              shape: BoxShape.circle,
            ),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedNotification02,
              color: kprimary,
              size: SizeConfig.blockHorizontal! * 6.0,
            ),
          )
        ],
      ),
    );
  }
}
