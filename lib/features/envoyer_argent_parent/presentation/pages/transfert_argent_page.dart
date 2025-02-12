import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:kori_etu/components/country_text_form_field_canada.dart';
import 'package:kori_etu/components/kori_autocomplete_text_form.dart';
import 'package:kori_etu/components/kori_dropdown_menu.dart';
import 'package:kori_etu/components/input_text_form_filed.dart';
import 'package:kori_etu/components/kori_app_bar.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/resources/country_canada.dart';
import 'package:kori_etu/core/resources/user.dart';
import 'package:kori_etu/core/utils/utils_function.dart';
import 'package:logger/logger.dart';

// ignore: must_be_immutable
class TransfertArgentPage extends StatefulWidget {
  const TransfertArgentPage({super.key});

  @override
  State<TransfertArgentPage> createState() => _TransfertArgentPageState();
}

class _TransfertArgentPageState extends State<TransfertArgentPage> {
  bool isLoading = false;

  bool saveBenefInfo = false;

  var cardController = MaskedTextController(mask: '0000 0000 0000 0000');

  var dateExpController = MaskedTextController(mask: '00/00');

  String modeDePaiement = "visa";

  List<String> mobielModePaiement = ["orange", "wave", "mtn", "moov", "wallet"];

  TextEditingController receiveController = TextEditingController();

  final TextEditingController benefNameController = TextEditingController();
  final TextEditingController motifController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController adresseController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  User userSelect = User(
    name: "Koffi",
    lastName: "Yao",
    country: "Côte d'Ivoire",
    city: "Abidjan",
    adresse: "Cocody, Rue des Jardins",
    phone: "+225 07 58 96 32",
  );

  TextEditingController senderMoneycontroller = TextEditingController();

  // var senderMoneycontroller = MoneyMaskedTextController(
  //   decimalSeparator: '.',
  //   thousandSeparator: ',',
  //   rightSymbol: ' F cfa',
  //   precision: 0,
  //   initialValue: 0.0,
  // );

  CountryCanada selectCountryValue = CountryCanada(
      name: '',
      currency: 'XOF',
      rate: 1,
      flag: '',
      code: '',
      dialCode: '',
      paymentSupport: [
        PaymentSupport(
          code: 'visa',
          libelle: 'Visa carte',
          icon: 'assets/images/visa-logo.png',
        ),
        PaymentSupport(
          code: 'wave',
          libelle: 'Wave Money',
          icon: 'assets/images/wave_money.png',
        ),
        PaymentSupport(
          code: 'orange',
          libelle: 'Orange Money',
          icon: 'assets/images/orange_money.png',
        ),
        PaymentSupport(
          code: 'mtn',
          libelle: 'MTN Money',
          icon: 'assets/images/mtn-logo.png',
        ),
        PaymentSupport(
          code: 'moov',
          libelle: 'MOOV Money',
          icon: 'assets/images/moov.png',
        ),
      ]);

  TextEditingController receiverMoneycontroller = TextEditingController();

  final NumberFormat formatXOF = NumberFormat.currency(
    locale: "fr_FR",
    symbol: "XOF",
    decimalDigits: 0, // Pas de décimales en général pour XOF
  );
  final NumberFormat formatCAD =
      NumberFormat.currency(locale: "en_CA", symbol: "CAD \$");

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
                  "Pays de destination :",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                CountryTextFormFieldCanada(
                  onCountryChange: (value) {
                    setState(() {
                      selectCountryValue = value;
                      Logger().f(value.toString());
                      countryController.text = value.name;
                      modeDePaiement = value.paymentSupport[0].code;
                      // receiverMoneycontroller = MoneyMaskedTextController(
                      //   decimalSeparator: '.',
                      //   thousandSeparator: ',',
                      //   rightSymbol: value.currency,
                      //   precision: 0,
                      // );
                    });
                  },
                ),

                SizedBox(height: SizeConfig.blockHorizontal! * 4.5),
                Row(
                  children: [
                    const Flexible(child: Divider()),
                    SizedBox(width: SizeConfig.blockHorizontal! * 2.5),
                    Text("Information du bénéficiaire",
                        style: TextStyle(
                          fontSize: SizeConfig.blockHorizontal! * 4.5,
                        )),
                    SizedBox(width: SizeConfig.blockHorizontal! * 2.5),
                    const Flexible(child: Divider()),
                  ],
                ),
                SizedBox(height: SizeConfig.blockHorizontal! * 4.5),
                KoriAutocompleteTextForm<User>(
                  labelText: "Bénéficiaire : ",
                  controller: benefNameController,
                  suffixIcon: const Icon(
                    HugeIcons.strokeRoundedUserEdit01,
                  ),
                  displayStringForOption: (User option) =>
                      "${option.name} ${option.lastName}",
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return Future.value(usersBeneficiaire);
                    }
                    return Future.value(
                      usersBeneficiaire.where((option) =>
                          option.name
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase()) ||
                          option.lastName
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase())),
                    );
                  },
                  onSelected: (value) {
                    setState(() {
                      benefNameController.text = value.name + value.lastName;
                      userSelect = value;
                      adresseController.text = value.adresse;
                      phoneController.text = value.phone;
                    });
                  },
                ),
                SizedBox(height: SizeConfig.blockHorizontal! * 4.5),
                // Info du beneficiaire
                InputTextFormFiled(
                  controller: adresseController,
                  labelText: "Adresse complet du bénéficiaire :",
                  hintText: "Adresse complet du bénéficiaire",
                  suffixIcon: const Icon(
                    HugeIcons.strokeRoundedCity03,
                  ),
                ),
                SizedBox(height: SizeConfig.blockHorizontal! * 4.5),
                InputTextFormFiled(
                  controller: phoneController,
                  labelText: "Numéro de téléphone du bénéficiaire : :",
                  hintText: "Numéro de téléphone du bénéficiaire",
                  keyboardType: const TextInputType.numberWithOptions(),
                  suffixIcon: const Icon(
                    HugeIcons.strokeRoundedSmartPhone01,
                  ),
                ),
                SizedBox(height: SizeConfig.blockHorizontal! * 4.5),
                Row(
                  children: [
                    const Flexible(child: Divider()),
                    SizedBox(width: SizeConfig.blockHorizontal! * 2.5),
                    Text("Mode de réception ",
                        style: TextStyle(
                          fontSize: SizeConfig.blockHorizontal! * 4.5,
                        )),
                    SizedBox(width: SizeConfig.blockHorizontal! * 2.5),
                    const Flexible(child: Divider()),
                  ],
                ),

                SizedBox(height: SizeConfig.blockHorizontal! * 4.5),
                KoriDropdownMenu<PaymentSupport>(
                  labelText: "Envoyer sur :",
                  items: selectCountryValue.paymentSupport,
                  onSelected: (value) {
                    Logger().i(value.toString());
                    setState(() {
                      modeDePaiement = value!.code;
                    });
                  },
                  dropdownMenuEntries: selectCountryValue.paymentSupport
                      .map<DropdownMenuEntry<PaymentSupport>>(
                          (PaymentSupport value) {
                    return DropdownMenuEntry<PaymentSupport>(
                      leadingIcon: Image.asset(
                        value.icon,
                        width: 25,
                        height: 25,
                      ),
                      value: value,
                      label: value.libelle,
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.white),
                      ),
                    );
                  }).toList(),
                ),

                if (modeDePaiement == "visa" ||
                    modeDePaiement == "mastercard") ...[
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
                ],

                if (mobielModePaiement.contains(modeDePaiement)) ...[
                  SizedBox(height: SizeConfig.blockHorizontal! * 4.5),
                  InputTextFormFiled(
                    labelText: "Numéro de téléphone mobile money :",
                    hintText: "Numéro de téléphone mobile money",
                    keyboardType: const TextInputType.numberWithOptions(),
                    suffixIcon: const Icon(
                      HugeIcons.strokeRoundedSmartPhone01,
                    ),
                  ),
                ],

                if (modeDePaiement == "bank") ...[
                  SizedBox(height: SizeConfig.blockHorizontal! * 4.5),
                  InputTextFormFiled(
                    labelText: "IBAN/Switch/BIC de la banque :",
                    hintText: "IBAN/Switch/BIC de la banque",
                    keyboardType: const TextInputType.numberWithOptions(),
                    suffixIcon: const Icon(
                      HugeIcons.strokeRoundedBank,
                    ),
                  ),
                ],
                SizedBox(height: SizeConfig.blockHorizontal! * 4.5),
                Row(
                  children: [
                    Flexible(
                      child: InputTextFormFiled(
                        labelText: "Vous envoyez (Fcfa) :",
                        hintText: "0",
                        keyboardType: TextInputType.number,
                        controller: senderMoneycontroller,
                        suffixIcon: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("XOF"),
                        ),
                        onChanged: (value) {
                          //if (value.isEmpty) return;
                          double v = 0;
                          setState(() {
                            if (value.isNotEmpty) {
                              v = int.parse(value) / selectCountryValue.rate;
                              v = double.parse(v.toStringAsFixed(3));
                            } else {
                              v = 0 * selectCountryValue.rate;
                            }
                            receiveController.text = "$v";
                          });
                        },
                      ),
                    ),
                    SizedBox(width: SizeConfig.blockHorizontal! * 2.5),
                    Flexible(
                      child: InputTextFormFiled(
                        labelText:
                            "Ils reçcoivent ${selectCountryValue.currency} :",
                        hintText: "0",
                        controller: receiveController,
                        keyboardType: const TextInputType.numberWithOptions(),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(selectCountryValue.currency),
                        ),
                        onChanged: (value) {
                          if (value.isEmpty) return;
                          double v = 0;
                          setState(() {
                            if (value.isNotEmpty) {
                              double amount = double.tryParse(value) ?? 0;
                              v = (amount * selectCountryValue.rate);
                              v = double.parse(v.toStringAsFixed(3));
                            } else {
                              v = 0 * selectCountryValue.rate;
                            }
                            senderMoneycontroller.text = "$v";
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.blockHorizontal! * 3.5),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: ksecondary.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Frais KORI = 1% ",
                    style: koriTextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.blockHorizontal! * 3.5,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.blockHorizontal! * 4.5),

                InputTextFormFiled(
                  labelText: "Motif :",
                  hintText: "Motif de transfert ",
                  minLines: 2,
                  maxLines: 5,
                  controller: motifController,
                  suffixIcon: const Icon(
                    HugeIcons.strokeRoundedPencilEdit02,
                  ),
                ),

                /// checkbox
                CheckboxListTile(
                  title: const Text(
                    'Enrégistrer les informations du bénéficiaire',
                  ),
                  value: saveBenefInfo,
                  onChanged: (bool? value) {
                    setState(() {
                      saveBenefInfo = !saveBenefInfo;
                    });
                  },
                ),

                SizedBox(height: SizeConfig.blockVertical! * 4.5),
                // SizedBox(height: SizeConfig.screenheigth! / 2),
                PrimaryButton(
                  isLoading: isLoading,
                  labelButton: "Valider",
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    Future.delayed(const Duration(seconds: 4), () {
                      setState(() {
                        isLoading = false;
                      });
                      if (!context.mounted) return;
                      context.pushNamed(RESUMERTRANSFERT, queryParameters: {
                        "amount": formatCAD
                            .format(double.tryParse(receiveController.text)),
                        "frais": 1.toString(),
                        "taux":
                            "${selectCountryValue.rate} ${selectCountryValue.currency}",
                        "total": formatXOF
                            .format(addOnePercent(senderMoneycontroller.text)),
                        "amountTotal":
                            "${formatXOF.format(double.tryParse(senderMoneycontroller.text))} XOF",
                        "userName": benefNameController.text,
                        "motif": motifController.text,
                        "country": countryController.text,
                        "adresse": adresseController.text,
                        "phone": phoneController.text,
                        "NumberCard": cardController.text,
                        "modeDepaiement": modeDePaiement,
                      });
                    });
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
