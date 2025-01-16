import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/features/dashboard_etuddiant/presentation/widgets/commnde_card.dart';
import 'package:kori_etu/features/dashboard_etuddiant/presentation/widgets/dashboard_app_bar.dart';
import 'package:kori_etu/features/dashboard_etuddiant/presentation/widgets/kori_money_card.dart';
import 'package:kori_etu/features/dashboard_etuddiant/presentation/widgets/kori_button_icon.dart';

class DashboardEtudiantPage extends StatelessWidget {
  const DashboardEtudiantPage({super.key});

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
                    labelText: "Déposer de l'argent",
                    onPressed: () {},
                    icon: HugeIcons.strokeRoundedPlusSignSquare,
                    color: Colors.orange,
                  ),
                  SizedBox(width: SizeConfig.blockHorizontal! * 2),
                  KoriButtonIcon(
                    labelText: "Transferer de l'argent",
                    onPressed: () {},
                    icon: HugeIcons.strokeRoundedUpload03,
                    color: Colors.green,
                  ),
                ],
              ),
            ),

            /// Espace
            SizedBox(height: SizeConfig.blockHorizontal! * 2.5),

            /// Card de bienvenu pour recuperer sa carte
            const CommndeCard(),

            SizedBox(height: SizeConfig.blockHorizontal! * 2.5),

            /// Transaction card
            Container(
              height: SizeConfig.screenheigth! * 0.5,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(kborder),
                  topRight: Radius.circular(kborder),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(5.0, 5.0),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text("Transaction d'aujourd'hui",
                        style: koriTextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: SizeConfig.blockHorizontal! * 3.5,
                        )),
                    subtitle: Text("0 transaction d'aujourd'hui",
                        style: koriTextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: SizeConfig.blockHorizontal! * 2.5,
                        )),
                    trailing: Container(
                      padding:
                          EdgeInsets.all(SizeConfig.blockHorizontal! * 2.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.5),
                        shape: BoxShape.circle,
                      ),
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedArrowUpRight01,
                        color: kprimary.withOpacity(0.5),
                        size: 24.0,
                      ),
                    ),
                  ),
                  Center(
                    child:
                        Text("Vous n'avez pas encore effectué de transactions.",
                            style: koriTextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              fontSize: SizeConfig.blockHorizontal! * 3.5,
                            )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
