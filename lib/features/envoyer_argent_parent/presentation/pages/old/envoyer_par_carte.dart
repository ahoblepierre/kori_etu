import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/features/envoyer_argent_parent/presentation/widgets/parent_dashboard_app_bar.dart';

class EnvoyerParCarte extends StatelessWidget {
  const EnvoyerParCarte({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const ParentDashboardAppBar(title: "Envoyer vers carte"),
            SizedBox(height: SizeConfig.blockHorizontal! * 10),
            Container(
              margin: const EdgeInsets.all(kborder),
              padding: const EdgeInsets.all(kborder),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(kborder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Saisir le montant",
                    style: koriTextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockHorizontal! * 2.5),
                  TextFormField(
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: koriTextStyle(
                      fontSize: SizeConfig.blockHorizontal! * 5.0,
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: InputDecoration(
                      hintText: '0, 00000 FCFA',
                      hintStyle: koriTextStyle(
                        fontSize: SizeConfig.blockHorizontal! * 5.0,
                        fontWeight: FontWeight.w700,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kborder),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kborder),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kborder),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockHorizontal! * 2.5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kborder),
              child: Text(
                "Envoyer depuis",
                style: koriTextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.blockHorizontal! * 2.5),
            InfoSendMoneyCard(
              leading: CircleAvatar(
                child: Image.asset("assets/images/kori_logo.png"),
              ),
              title: 'Wallet Kori',
              subTitle: '8283487712398',
            ),
            SizedBox(height: SizeConfig.blockHorizontal! * 2.5),
            HugeIcon(
              icon: HugeIcons.strokeRoundedCircleArrowDataTransferVertical,
              color: kprimary,
              size: SizeConfig.blockHorizontal! * 15.0,
            ),
            SizedBox(height: SizeConfig.blockHorizontal! * 3.5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kborder),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Destinataire",
                    style: koriTextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Choisir",
                    style: koriTextStyle(
                      color: kprimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.blockHorizontal! * 2.5),
            InfoSendMoneyCard(
              leading: Image.asset("assets/images/mastercard_logo.png"),
              title: 'Daniella JHONSON',
              subTitle: '2829383983 | 04-00-04',
            ),
            SizedBox(height: SizeConfig.blockHorizontal! * 3.5),
            TextFormField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Ajouter une note',
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kborder),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kborder),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kborder),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                suffixIcon: const Icon(
                  HugeIcons.strokeRoundedEdit02,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.blockVertical! * 19.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kborder),
              child: PrimaryButton(
                labelButton: "Continuer",
                onPressed: () {
                  context.pushNamed(RESUMERTRANSFERT);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoSendMoneyCard extends StatelessWidget {
  const InfoSendMoneyCard({
    super.key,
    required this.leading,
    required this.title,
    required this.subTitle,
  });
  final Widget leading;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kborder),
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
      child: ListTile(
        leading: leading,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
        ),
        trailing: const Icon(
          HugeIcons.strokeRoundedArrowRight01,
          color: Colors.black,
        ),
      ),
    );
  }
}
