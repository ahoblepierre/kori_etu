import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/components/input_text_form_filed.dart';
import 'package:kori_etu/components/kori_app_bar.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/resources/scaffold_message_enum.dart';
import 'package:kori_etu/core/utils/utils.dart';

// ignore: must_be_immutable
class TransfertArgentServiceCart extends StatefulWidget {
  const TransfertArgentServiceCart({super.key});

  @override
  State<TransfertArgentServiceCart> createState() =>
      _TransfertArgentServiceCartState();
}

class _TransfertArgentServiceCartState
    extends State<TransfertArgentServiceCart> {
  List<String> typeDeCarte = ["Carte Virtuelle", "Carte Physique"];

  bool isLoading = false;
  bool isLoadingCreateCarte = false;
  bool isLoadingOrderCarte = false;

  String message = 'Finalisation de la création de la carte';

  @override
  Widget build(BuildContext context) {
    /// Screeen size  config
    SizeConfig().init(context);

    ///
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      appBar: const KoriAppBar(title: "Service Carte"),
      body: SafeArea(
        minimum: const EdgeInsets.all(kborder),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.blockHorizontal! * 5.5),

            Image.asset(
              "assets/images/credit-cardt.png",
              // height: SizeConfig.screenWidth! / 5,
              width: double.infinity,
            ),

            PrimaryButton(
              isLoading: isLoadingCreateCarte,
              labelButton: "Créer une carte virtuelle Kori",
              onPressed: () {
                setState(() {
                  isLoadingCreateCarte = true;
                });
                Future.delayed(const Duration(seconds: 5), () {
                  if (!context.mounted) return;
                  koriScaffoldMessage(
                    context,
                    "Votre carte virtuelle est en cours de création. Vous recevrez une notification dès que sa création sera confirmée. Nous vous remercions pour votre patience.",
                    statut: Statut.SUCCESS,
                  );
                  setState(() {
                    isLoadingCreateCarte = false;
                  });
                  context.pushNamed(DASHBOARD);
                });
              },
            ),
            SizedBox(height: SizeConfig.blockHorizontal! * 10.5),
            PrimaryButton(
              isLoading: isLoadingOrderCarte,
              labelButton: "Commander une carte Kori",
              onPressed: () {
                // context.goNamed(DASHBOARD);
                koriDialog(
                  context,
                  onSubmit: () {
                    setState(() {
                      isLoadingOrderCarte = true;
                    });
                    Navigator.of(context).pop();
                    Future.delayed(const Duration(seconds: 5), () {
                      if (!context.mounted) return;
                      setState(() {
                        isLoadingOrderCarte = false;
                      });
                      koriScaffoldMessage(
                        context,
                        "Votre carte physique commandé avec succès",
                        statut: Statut.SUCCESS,
                      );
                    });
                  },
                  onDismiss: () => Navigator.of(context).pop(),
                  height: SizeConfig.screenWidth! * 1.3,
                  body: Column(
                    children: [
                      InputTextFormFiled(
                        labelText: "Votre nom & prénoms :",
                        hintText: "Votre nom & prénoms :",
                        suffixIcon: const Icon(
                          HugeIcons.strokeRoundedPencilEdit02,
                        ),
                      ),
                      // SizedBox(height: SizeConfig.blockHorizontal! * 10.5),
                      InputTextFormFiled(
                        labelText: "Adresse de livraison :",
                        hintText: "Adresse de livraison :",
                        suffixIcon: const Icon(
                          HugeIcons.strokeRoundedCity03,
                        ),
                      ),
                      InputTextFormFiled(
                        labelText: "Numéro de Téléphone :",
                        hintText: "Numéro de Téléphone :",
                        keyboardType: const TextInputType.numberWithOptions(),
                        suffixIcon: const Icon(
                          HugeIcons.strokeRoundedSmartPhone01,
                        ),
                      ),
                      SizedBox(height: SizeConfig.blockHorizontal! * 9.5),
                    ],
                  ),
                  actionText: 'Valider',
                  cancellText: 'Annuller',
                  title: 'Remplir tous les champs',
                );
              },
            ),
            // const KoriLoading(),
            const Spacer(),
            PrimaryButton(
              labelButton: "Retour au tableau de bord",
              isLoading: isLoading,
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                Future.delayed(const Duration(seconds: 4), () {
                  setState(() {
                    isLoading = true;
                  });
                  if (!context.mounted) return;

                  context.pushNamed(DASHBOARD);
                });
              },
            ),
            SizedBox(height: SizeConfig.blockHorizontal! * 15.5),
          ],
        ),
      ),
    );
  }
}
