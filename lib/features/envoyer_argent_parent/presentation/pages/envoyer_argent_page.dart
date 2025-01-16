import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/components/country_text_form_field.dart';
import 'package:kori_etu/components/kori_dropdown_menu.dart';
import 'package:kori_etu/components/input_text_form_filed.dart';
import 'package:kori_etu/components/kori_app_bar.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/resources/operateur.dart';

// ignore: must_be_immutable
class EnvoyerArgentPage extends StatelessWidget {
  EnvoyerArgentPage({super.key});

  var cardController = MaskedTextController(mask: '0000 0000 0000 0000');
  var dateExpController = MaskedTextController(mask: '00/00');

  var senderMoneycontroller = MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
    rightSymbol: ' F cfa',
    precision: 0,
  );

  var receiverMoneycontroller = MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
    rightSymbol: 'EUR ',
    precision: 0,
  );

  List<Operateur> operateurListes = List.from(operateurs);

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
      appBar: const KoriAppBar(title: "Envoyer de l'argent"),
      body: SafeArea(
        minimum: const EdgeInsets.all(kborder),
        child: ListView(
          children: [
            /// Input to choice country
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Pays d'envoie :",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                const CountryTextFormField(),
                SizedBox(height: SizeConfig.blockHorizontal! * 4.5),
                Row(
                  children: [
                    Flexible(
                      child: InputTextFormFiled(
                        labelText: "Vous envoyez (Fcfa) :",
                        hintText: "0",
                        keyboardType: TextInputType.number,
                        controller: senderMoneycontroller,
                        suffixIcon: const Icon(
                          HugeIcons.strokeRoundedMoney03,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.blockHorizontal! * 2.5),
                    Flexible(
                      child: InputTextFormFiled(
                        labelText: "Ils reçcoivent (Eur) :",
                        hintText: "0",
                        controller: receiverMoneycontroller,
                        keyboardType: const TextInputType.numberWithOptions(),
                        suffixIcon: const Icon(
                          HugeIcons.strokeRoundedMoney03,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.blockHorizontal! * 4.5),
                Row(
                  children: [
                    const Flexible(child: Divider()),
                    SizedBox(width: SizeConfig.blockHorizontal! * 2.5),
                    Text("Informatuon du bénéficiaire",
                        style: TextStyle(
                          fontSize: SizeConfig.blockHorizontal! * 4.5,
                        )),
                    SizedBox(width: SizeConfig.blockHorizontal! * 2.5),
                    const Flexible(child: Divider()),
                  ],
                ),
                SizedBox(height: SizeConfig.blockHorizontal! * 4.5),
                KoriDropdownMenu<Operateur>(
                  labelText: "Envoyer sur :",
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
                SizedBox(height: SizeConfig.blockHorizontal! * 4.5),
                InputTextFormFiled(
                  labelText: "Nom complet du bénéficiaire :",
                  hintText: "Nom complet du bénéficiaire",
                  suffixIcon: const Icon(
                    HugeIcons.strokeRoundedUserEdit01,
                  ),
                ),
                SizedBox(height: SizeConfig.blockHorizontal! * 4.5),
                Row(
                  children: [
                    Flexible(
                      flex: 4,
                      child: InputTextFormFiled(
                        labelText: "Numéro de la carte :",
                        hintText: "0",
                        controller: cardController,
                        keyboardType: const TextInputType.numberWithOptions(),
                        suffixIcon: const Icon(
                          HugeIcons.strokeRoundedCreditCardValidation,
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.blockHorizontal! * 2.5),
                    Flexible(
                      flex: 2,
                      child: InputTextFormFiled(
                        labelText: "Date Exp :",
                        hintText: "07/24",
                        keyboardType: TextInputType.number,
                        controller: dateExpController,
                        suffixIcon: const Icon(
                          HugeIcons.strokeRoundedCalendar03,
                        ),
                      ),
                    ),
                  ],
                ),

                /// checkbox
                ///
                CheckboxListTile(
                  title: const Text(
                    'Enrégistrer les informations du bénéficiaire',
                  ),
                  value: true,
                  onChanged: (bool? value) {},
                ),

                SizedBox(height: SizeConfig.blockVertical! * 4.5),
                // SizedBox(height: SizeConfig.screenheigth! / 2),
                PrimaryButton(
                  labelButton: "Suivant",
                  onPressed: () {
                    context.pushNamed(RESUMERTRANSFERT);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
