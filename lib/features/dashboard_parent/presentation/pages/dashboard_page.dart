import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/services/storage_service.dart';
import 'package:kori_etu/features/dashboard_etuddiant/presentation/widgets/kori_button_icon.dart';
import 'package:kori_etu/features/dashboard_parent/presentation/widgets/recent_transaction_list.dart';
import 'package:kori_etu/features/dashboard_parent/presentation/widgets/transaction_card_list.dart';
import 'package:logger/logger.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///Satut bar
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    /// Screeen size  config
    SizeConfig().init(context);

    Logger().i(StorageService().authToken);

    /// Screeen
    return Scaffold(
      appBar: const DashboardAppBar(),
      body: Flex(
        // mainAxisSize: MainAxisSize.min,
        direction: Axis.vertical,

        children: [
          /// Dashboard Card
          // DashboardCard(),
          SizedBox(height: SizeConfig.blockHorizontal! * 5),

          /// List recents user transaction
          const RecentTransactionList(),

          /// List des transactions
          const TransactionCardList(),
        ],
      ),
    );
  }
}

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
