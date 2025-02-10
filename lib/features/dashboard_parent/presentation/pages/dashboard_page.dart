// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/core/resources/scaffold_message_enum.dart';
import 'package:kori_etu/core/utils/utils.dart';

import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/services/storage_service.dart';
import 'package:kori_etu/features/dashboard_parent/presentation/widgets/dashboard_app_bar.dart';
import 'package:kori_etu/features/dashboard_parent/presentation/widgets/kori_drawer.dart';
import 'package:kori_etu/features/dashboard_parent/presentation/widgets/transaction_card_list.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  StorageService storageService = StorageService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool identification = storageService.getCache("identification") ?? false;

    ///Satut bar
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    /// Screeen size  config
    SizeConfig().init(context);

    // storageService.removeAllCache();

    // Logger().i(StorageService().authToken);
    // storageService.removeCache("identification");
    // Logger().i(storageService.getCache("identification"));

    /// Screeen
    return Scaffold(
      appBar: DashboardAppBar(identification: identification),
      drawer: const KoriDrawer(),
      body: Flex(
        // mainAxisSize: MainAxisSize.min,
        direction: Axis.vertical,

        children: [
          /// Dashboard Card
          // DashboardCard(),
          SizedBox(height: SizeConfig.blockHorizontal! * 5),
          // Functionnalité de carte et de transfert
          Container(
            decoration: const BoxDecoration(),
            padding: const EdgeInsets.all(kborder),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SimpleButton(
                  text: "Transfert d'argent",
                  icon: HugeIcons.strokeRoundedSaveMoneyDollar,
                  onTap: () {
                    if (!identification) {
                      koriScaffoldMessage(
                        context,
                        "Accéss limité au service. Complèté votre KYC",
                        statut: Statut.WARNING,
                      );
                    } else {
                      context.pushNamed(TRANSFERTARGENT);
                    }
                  },
                ),
                SimpleButton(
                  text: "Service Carte",
                  icon: HugeIcons.strokeRoundedCreditCardPos,
                  onTap: () {
                    if (!identification) {
                      koriScaffoldMessage(
                        context,
                        "Accéss limité au service. Complèté votre KYC",
                        statut: Statut.WARNING,
                      );
                    } else {
                      context.pushNamed(TRANSFERTSERVICECARTE);
                    }
                  },
                )
              ],
            ),
          ),

          /// List recents user transaction
          // const RecentTransactionList(),

          /// List des transactions
          const TransactionCardList(),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class SimpleButton extends StatelessWidget {
  SimpleButton({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  final String text;
  final IconData icon;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: ksecondary, borderRadius: BorderRadius.circular(kborder)),
        padding: const EdgeInsets.all(kborder),
        child: Row(
          children: [
            Icon(
              icon,
              color: kprimary,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: koriTextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
