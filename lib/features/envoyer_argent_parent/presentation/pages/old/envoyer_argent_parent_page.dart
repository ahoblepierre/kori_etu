import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/features/envoyer_argent_parent/data/data_source/send_money.dart';
import 'package:kori_etu/features/envoyer_argent_parent/presentation/widgets/parent_dashboard_app_bar.dart';

class EnvoyerArgentParentPage extends StatefulWidget {
  const EnvoyerArgentParentPage({super.key});

  @override
  State<EnvoyerArgentParentPage> createState() =>
      _EnvoyerArgentParentPageState();
}

class _EnvoyerArgentParentPageState extends State<EnvoyerArgentParentPage> {
  int currentIndex = 0;
  final List<SendMoney> items = [
    SendMoney(
      title: "Wallet Kori",
      description: "Envoyer de l'argent vers un wallet kori",
      imagePath: "assets/images/kori_logo.png",
    ),
    SendMoney(
      title: "Carte bancaire",
      description: "Envoyer de l'argent vers une carte bancaire",
      imagePath: "assets/images/mastercard_logo.png",
    ),
    SendMoney(
      title: "Mobile Money",
      description: "Envoyer de l'argent vers un mobile money",
      imagePath: "assets/images/kori_logo.png",
    ),
    SendMoney(
      title: "Compte bancaire",
      description: "Envoyer de l'argent vers un compte bancaire",
      imagePath: "assets/images/bank-account .png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(kborder),
        child: Column(
          children: [
            const ParentDashboardAppBar(title: "Envoyer de l'argent"),
            SizedBox(height: SizeConfig.blockHorizontal! * 15),
            GridView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(kborder),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:
                            currentIndex == index ? ksecondary : Colors.grey),
                    borderRadius: BorderRadius.circular(kborder),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        child: Image.asset(
                          items[index].imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockHorizontal! * 2.5),
                      Text(
                        items[index].title,
                        style: koriTextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockHorizontal! * 2.5),
                      Text(
                        items[index].description,
                        style: koriTextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                          context.pushNamed(ENVOYERARGENTPARENTPARCARTE);
                        },
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            HugeIcons.strokeRoundedArrowRight01,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
