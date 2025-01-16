import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/features/dashboard_etuddiant/presentation/widgets/dashboard_app_bar.dart';
import 'package:kori_etu/features/dashboard_etuddiant/presentation/widgets/kori_money_card.dart';
import 'package:kori_etu/features/dashboard_etuddiant/presentation/widgets/kori_button_icon.dart';
import 'package:kori_etu/features/dashboard_parent/presentation/widgets/transaction_card_list.dart';

import '../../../../config/routes/route_name.dart';

class DashboardParentPage extends StatelessWidget {
  const DashboardParentPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            /// Dashboard App bar
            const DashboardAppBar(),

            SizedBox(height: SizeConfig.blockHorizontal! * 2.5),

            ///Money card
            const KoriMoneyCard(),

            /// Espace
            SizedBox(height: SizeConfig.blockHorizontal! * 2.5),

            /// echange buuton
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kborder),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KoriButtonIcon(
                    labelText: "Envoyer de l'argent",
                    onPressed: () {
                      context.pushNamed(ENVOYERARGENT);
                    },
                    icon: HugeIcons.strokeRoundedPlusSignSquare,
                    color: Colors.green,
                  ),
                  KoriButtonIcon(
                    labelText: "Retirer de l'argent",
                    onPressed: () {
                      context.pushNamed(AUTHENTICATED);
                    },
                    icon: HugeIcons.strokeRoundedUpload03,
                    color: Colors.red,
                  ),
                ],
              ),
            ),

            SizedBox(height: SizeConfig.blockHorizontal! * 2.5),

            /// Transaction card
            const TransactionCardList(),
          ],
        ),
      ),
    );
  }
}
