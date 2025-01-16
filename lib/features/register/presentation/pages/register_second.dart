import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kori_etu/components/pays_text_form_field.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/features/register/presentation/widgets/register_app_bar.dart';

class RegisterSecond extends StatelessWidget {
  RegisterSecond({super.key});

  final TextEditingController paysController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: kespacing),
          child: Column(
            children: [
              const RegisterAppBar(),
              SizedBox(height: SizeConfig.blockHorizontal! * 5),
              Text(
                "Quel est votre pays de résidence ?",
                style: koriTextStyle(
                  fontSize: SizeConfig.blockHorizontal! * 7,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: SizeConfig.blockHorizontal! * 5),
              PaysTextFormField(
                controller: paysController,
              ),
              SizedBox(height: SizeConfig.blockHorizontal! * 5),
              const Spacer(),
              PrimaryButton(
                labelButton: "Continuer",
                onPressed: () {
                  context.pushNamed(REGISTER);
                },
              ),
            ],
          )),
    );
  }
}
