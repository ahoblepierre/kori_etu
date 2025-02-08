import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/features/dashboard_etuddiant/presentation/widgets/kori_button_icon.dart';

import '../../../../config/theme/style.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// Screeen size  config
    SizeConfig().init(context);
    return AppBar(
      backgroundColor: kprimary,
      leading: IconButton(
        padding: const EdgeInsets.only(bottom: 10),
        icon: const Icon(Icons.menu_open, size: 30, color: Colors.white),
        onPressed: () {
          Scaffold.of(context).openDrawer(); //
        },
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(kborder),
          bottomRight: Radius.circular(kborder),
        ),
      ),
      flexibleSpace: Container(
        padding: const EdgeInsets.all(kborder),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bienvenue chez Kori",
                style: koriTextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.blockHorizontal! * 5.0,
                  fontWeight: FontWeight.w400,
                )),
            Row(
              children: [
                Text(
                  "Identifiez votre compte Kori. ",
                  style: koriTextStyle(
                    color: ksecondary.withOpacity(0.7),
                  ),
                ),
                Text(
                  " Identification ",
                  style: koriTextStyle(color: ksecondary),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    context.pushNamed(IDENTIFICATION);
                  },
                  icon: const Icon(
                    HugeIcons.strokeRoundedArrowRight04,
                    color: ksecondary,
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: kborder),
              width: double.infinity,
              child: KoriButtonIcon(
                labelText: "Envoyer de l'argent",
                onPressed: () {
                  context.pushNamed(ENVOYERARGENT);
                },
                icon: HugeIcons.strokeRoundedMoneySend01,
                color: kprimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(
        SizeConfig.screenWidth!,
        SizeConfig.screenheigth! * 0.22,
      );
}
