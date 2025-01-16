import 'package:flutter/material.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';

class CommndeCard extends StatelessWidget {
  const CommndeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kborder),
      padding: const EdgeInsets.all(kborder),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kborder),
        border: Border.all(color: kprimary),
      ),
      child: Column(
        children: [
          /// First line
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: kprimary.withOpacity(0.2),
                radius: SizeConfig.blockHorizontal! * 8.5,
                child: Image.asset(
                  "assets/images/kori_card.png",
                  width: SizeConfig.blockHorizontal! * 10.5,
                ),
              ),
              SizedBox(width: SizeConfig.blockHorizontal! * 2.5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Commander une carte physique dès maintenant !",
                      style: koriTextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.blockHorizontal! * 4.5,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: SizeConfig.blockHorizontal! * 2.5),
                    Text(
                      "Simplifiez vos transactions et accédez à tous les avantages de votre compte en commandant votre carte physique. Profitez de paiements sécurisés et sans contact, où que vous soyez.",
                      style: koriTextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: ksecondFont,
                        color: Colors.grey,
                        fontSize: SizeConfig.blockHorizontal! * 3.0,
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: SizeConfig.blockHorizontal! * 2.5),

          /// Second line
          PrimaryButton(
            labelButton: "Commander ma carte",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
