import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/features/introduction/presentation/widgets/change_language_widget.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kprimary,
      body: SafeArea(
        child: Column(
          children: [
            const ChangeLanguageWidget(),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: kespacing),
              width: double.infinity,
              height: SizeConfig.blockVertical! * 50,
              alignment: AlignmentDirectional.bottomCenter,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/cercle_blanc_jaune.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    "Welcome to kori, Proudly African",
                    style: koriTextStyle(
                      fontSize: SizeConfig.blockHorizontal! * 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: kespacing),
                  Text(
                    "Create an account or log in to access your services and manage funds with ease.",
                    textAlign: TextAlign.center,
                    style: koriTextStyle(
                      color: kprimary,
                      fontSize: SizeConfig.blockHorizontal! * 4,
                    ),
                  ),
                  const Spacer(),
                  PrimaryButton(
                    labelButton: "Commencer",
                    onPressed: () {
                      context.go(SINGUPFIRST);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
