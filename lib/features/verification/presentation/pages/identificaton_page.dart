import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/components/input_text_form_filed.dart';
import 'package:kori_etu/components/kori_dropdown_menu.dart';
import 'package:kori_etu/components/kori_graduate_app_bar.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';

// ignore: must_be_immutable
class IdentificatonPage extends StatelessWidget {
  IdentificatonPage({super.key});

  var dateNaissanceController = MaskedTextController(mask: '0000-00-00');

  List<String> documentsIdentificatons = [
    "Carte d'identité nationale",
    "Passeport",
    "Carte de sejour",
    "Permis de conduire",
    "Carte consulaire",
  ];

  @override
  Widget build(BuildContext context) {
    /// confi size
    SizeConfig().init(context);

    return Scaffold(
      appBar: const KoriGraduateAppBar(grade: 0.3),

      /// Body
      body: SafeArea(
        minimum: const EdgeInsets.all(kborder),
        child: ListView(
          children: [
            ListBody(
              children: [
                Text(
                  "Identification ",
                  style: koriTextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: SizeConfig.blockHorizontal! * 5),
                Text(
                  "Nous avons besoin d'informations supplémentaires de votre part pour sécuriser votre compte.",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 17),
                ),
                SizedBox(height: SizeConfig.blockHorizontal! * 10),
                InputTextFormFiled(
                  labelText: "Entrez votre nom de famille :",
                  hintText: "Nom de famille",
                  onChanged: (value) {},
                  suffixIcon: const Icon(
                    HugeIcons.strokeRoundedUserAccount,
                  ),
                ),
                SizedBox(height: SizeConfig.blockHorizontal! * 5),
                InputTextFormFiled(
                  labelText: "Entrez vos prénoms :",
                  hintText: "Prénoms",
                  onChanged: (value) {},
                  suffixIcon: const Icon(
                    HugeIcons.strokeRoundedUserAccount,
                  ),
                ),
                SizedBox(height: SizeConfig.blockHorizontal! * 5),
                InputTextFormFiled(
                  labelText: "Date de naissance:",
                  hintText: "Date de naissance (AAAA-MM-jj)",
                  controller: dateNaissanceController,
                  keyboardType: const TextInputType.numberWithOptions(),
                  onChanged: (value) {},
                  suffixIcon: const Icon(
                    HugeIcons.strokeRoundedCalendar03,
                  ),
                ),
                SizedBox(height: SizeConfig.blockHorizontal! * 5),
                KoriDropdownMenu<String>(
                  labelText: "Pièce d'identité",
                  items: documentsIdentificatons,
                  dropdownMenuEntries: documentsIdentificatons
                      .map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                      value: value,
                      label: value,
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.white),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: SizeConfig.blockVertical! * 10),
                const Icon(
                  HugeIcons.strokeRoundedSquareLock02,
                ),
                Text(
                  "Vos informations sont sécurisées par cryptage.",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 17),
                  textAlign: TextAlign.center,
                ),
                PrimaryButton(
                  labelButton: "Suivant",
                  onPressed: () {
                    context.pushNamed(IDENTIFICATIONSECONDE);
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
