import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/features/dashboard_etuddiant/presentation/widgets/kori_button_icon.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: const EdgeInsets.all(kborder),
      height: SizeConfig.screenheigth! * 0.3,
      width: SizeConfig.screenWidth,
      decoration: const BoxDecoration(
        color: kprimary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(kborder),
          bottomRight: Radius.circular(kborder),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Bienvenue chez Kori",
              style: koriTextStyle(
                color: Colors.white,
                fontSize: SizeConfig.blockHorizontal! * 7.0,
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
              icon: HugeIcons.strokeRoundedPlusSignSquare,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
