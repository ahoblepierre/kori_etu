import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';

class KoriMoneyCard extends StatelessWidget {
  const KoriMoneyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kborder),
      padding: const EdgeInsets.all(kborder),
      decoration: BoxDecoration(
        border: Border.all(color: ksecondary),
        color: Colors.white,
        borderRadius: BorderRadius.circular(kborder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// First ligne
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/kori_logo_text.png",
                width: SizeConfig.blockHorizontal! * 10.0,
              ),
              Container(
                height: SizeConfig.blockHorizontal! * 7.0,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kespacing + 10),
                  border: Border.all(color: Colors.grey, width: 0.5),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "XOF(franc CFA)",
                      style: koriTextStyle(
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(width: SizeConfig.blockHorizontal! * 1.5),
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedArrowDown01,
                      color: kprimary,
                      size: SizeConfig.blockHorizontal! * 4.0,
                    )
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: SizeConfig.blockHorizontal! * 2.5),

          /// Second ligne
          Row(
            children: [
              Text(
                "Solde total",
                style: koriTextStyle(
                  color: Colors.grey,
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedView,
                  color: Colors.grey,
                  size: SizeConfig.blockHorizontal! * 5.0,
                ),
              )
            ],
          ),

          Text(
            "CFA 00, 000000",
            style: koriTextStyle(
              color: kprimary,
              fontSize: SizeConfig.blockHorizontal! * 8.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: SizeConfig.blockHorizontal! * 5.0),

          /// third ligne
          Text(
            "Dernière mise à jour : 27/05/2024",
            style: koriTextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
