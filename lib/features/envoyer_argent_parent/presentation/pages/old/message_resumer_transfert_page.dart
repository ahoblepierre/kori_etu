import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';

class MessageResumerTransfertPage extends StatelessWidget {
  const MessageResumerTransfertPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(kborder),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),

            /// Text
            Text(
              "Envoie effectué",
              style: koriTextStyle(
                fontSize: SizeConfig.blockHorizontal! * 7,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),

            /// Richet text
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Votre transfert de ",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontFamily: ksecondFont,
                    fontSize: 16,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' 100.000 Fcfa',
                      style: koriTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: " à Daniel JHONSON a été envoyé avec succès.",
                      style: koriTextStyle(
                        color: Colors.grey,
                        fontFamily: ksecondFont,
                        fontSize: 16,
                      ),
                    )
                  ]),
            ),

            const SizedBox(height: 30),

            /// Btn transactions and reçu
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: ButtonTransaction(
                    icon: HugeIcons.strokeRoundedCouponPercent,
                    title: "Voir le reçu",
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: ButtonTransaction(
                    icon: HugeIcons.strokeRoundedCreditCardAccept,
                    title: "Voir le transaction",
                  ),
                ),
              ],
            ),

            const Spacer(),
            PrimaryButton(
              labelButton: "Retour à l'accueil",
              onPressed: () {
                context.go("/$DASHBOARD");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonTransaction extends StatelessWidget {
  const ButtonTransaction({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      padding: const EdgeInsets.all(kborder),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kborder),
        border: Border.all(width: 1, color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.grey,
            size: 30.0,
          ),
          Text(
            title,
            style: koriTextStyle(
              color: Colors.grey,
              fontFamily: ksecondFont,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
