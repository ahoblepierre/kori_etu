import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:kori_etu/components/kori_dropdown_menu.dart';
import 'package:kori_etu/components/input_text_form_filed.dart';
import 'package:kori_etu/components/kori_app_bar.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/resources/operateur.dart';

// ignore: must_be_immutable
class ResumeTransfert extends StatelessWidget {
  ResumeTransfert({super.key});

  List<Operateur> operateurListes = List.from(operateurs);

  @override
  Widget build(BuildContext context) {
    /// size init config
    SizeConfig().init(context);

    ///
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      appBar: const KoriAppBar(title: "Résumé du transfert"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.blockHorizontal! * 5),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: kborder),
                padding: const EdgeInsets.all(kborder),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// First Ligne
                    SizedBox(height: SizeConfig.blockHorizontal! * 3.5),

                    /// Other Line
                    const ResumeInfo(
                        title: "Montant net", value: "100.000 FCFA"),

                    const ResumeInfo(title: "Frais", value: "0"),

                    const ResumeInfo(title: "Taux de change", value: "0"),

                    const ResumeInfo(
                      title: "Votre bénéficiaire reçois",
                      value: "0",
                    ),

                    SizedBox(height: SizeConfig.blockHorizontal! * 3.5),

                    Text(
                      "Montant total",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: SizeConfig.blockHorizontal! * 5.0,
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockHorizontal! * 3.5),

                    /// Print total amount
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        "100.000 FCFA",
                        style: koriTextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: SizeConfig.blockHorizontal! * 5.5,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kborder),
                child: KoriDropdownMenu<Operateur>(
                  labelText: "Mon Opérateur",
                  items: operateurListes,
                  dropdownMenuEntries: operateurListes
                      .map<DropdownMenuEntry<Operateur>>((Operateur value) {
                    return DropdownMenuEntry<Operateur>(
                      leadingIcon: Image.asset(
                        value.imagePath,
                        width: 25,
                        height: 25,
                      ),
                      value: value,
                      label: value.name,
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.white),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kborder),
                child: InputTextFormFiled(
                  labelText: "Numéro de téléphone",
                  hintText: "Numéro de téléphone",
                ),
              ),
              SizedBox(height: SizeConfig.blockVertical! * 15.5),
              Padding(
                padding: const EdgeInsets.all(kborder),
                child: PrimaryButton(
                  labelButton: "Envoyer",
                  onPressed: () {
                    context.pushNamed(MESSAGERESUMERTRANSFERT);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResumeInfo extends StatelessWidget {
  const ResumeInfo({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
