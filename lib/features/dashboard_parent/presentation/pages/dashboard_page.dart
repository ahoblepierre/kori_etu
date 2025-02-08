import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/services/storage_service.dart';
import 'package:kori_etu/features/dashboard_parent/presentation/widgets/dashboard_app_bar.dart';
import 'package:kori_etu/features/dashboard_parent/presentation/widgets/kori_drawer.dart';
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SimpleButton(
                    text: 'Transafert', icon: HugeIcons.strokeRoundedHome11),
                SimpleButton(
                    text: "Transfert sur carte",
                    icon: HugeIcons.strokeRoundedCreditCardPos)
              ],
            ),
          ),

          /// List recents user transaction
          const RecentTransactionList(),

          /// List des transactions
          const TransactionCardList(),
        ],
      ),
    );
  }
}

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
