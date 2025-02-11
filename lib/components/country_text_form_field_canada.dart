import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/components/input_text_form_filed.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/resources/country.dart';
import 'package:kori_etu/core/resources/country_canada.dart';

class CountryTextFormFieldCanada extends StatefulWidget {
  const CountryTextFormFieldCanada({
    super.key,
    this.controller,
    this.onCountryChange,
  });
  final TextEditingController? controller;
  final void Function(CountryCanada)? onCountryChange;

  @override
  State<CountryTextFormFieldCanada> createState() =>
      _CountryTextFormFieldCanadaState();
}

CountryCanada _selectedValue = CountryCanada(
  name: "Côte d'Ivoire",
  flag: '🇨🇮',
  code: 'CI',
  dialCode: '225',
  currency: 'XOF',
  rate: 1,
  paymentSupport: [
    PaymentSupport(
        code: 'visa',
        libelle: 'Visa',
        icon: 'assets/images/mastercard_logo.png'),
  ],
);

int _currenctIndex = 0;

List<CountryCanada> koriAppCountries = List.from(countriesCanada);

class _CountryTextFormFieldCanadaState
    extends State<CountryTextFormFieldCanada> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () => _displayBottomSheet(context),
      readOnly: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: kborder),
        hintText:
            "${_selectedValue.flag}    ${_selectedValue.name} (${_selectedValue.currency})",
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(
          color: Colors.grey[600],
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: const Icon(
          HugeIcons.strokeRoundedArrowDown01,
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kgrey,
          ),
          borderRadius: BorderRadius.circular(kborderInput),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kprimary),
          borderRadius: BorderRadius.circular(kborderInput),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(kborderInput),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(kborderInput),
        ),
      ),
    );
  }

  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: kscaffoldBackgroundColor,
      isScrollControlled: true,
      context: context,
      constraints: BoxConstraints(maxHeight: SizeConfig.screenheigth! * 0.8),
      scrollControlDisabledMaxHeightRatio: 0.7,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(25),
          height: SizeConfig.blockVertical! * 20 * countries.length,
          child: StatefulBuilder(builder: (context, setModalState) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputTextFormFiled(
                    labelText: "Rechercher votre pays",
                    onChanged: (value) {
                      setModalState(() {
                        if (value.isEmpty) {
                          koriAppCountries = List.from(countriesCanada);
                        } else {
                          final searchList = countriesCanada
                              .where((country) =>
                                  country.name
                                      .toLowerCase()
                                      .contains(value.toLowerCase()) ||
                                  country.code
                                      .toLowerCase()
                                      .contains(value.toLowerCase()))
                              .toList();
                          koriAppCountries = searchList;
                        }
                      });
                    },
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(kborder),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Annuller",
                          style: TextStyle(
                            color: kprimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    prefixIcon: const HugeIcon(
                      icon: HugeIcons.strokeRoundedSearch01,
                      color: kprimary,
                      size: 20.0,
                    ),
                    hintText: "Rechercher ...",
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                      child: ListView.builder(
                    itemCount: koriAppCountries.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedValue = countriesCanada[index];
                            _currenctIndex = index;
                            widget.controller?.text = _selectedValue.name;
                            widget.onCountryChange?.call(_selectedValue);
                            koriAppCountries = List.from(countriesCanada);
                          });
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: kborder, horizontal: kborder),
                          decoration: BoxDecoration(
                            color: _currenctIndex == index
                                ? kprimary.withOpacity(0.3)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${koriAppCountries[index].flag} ${koriAppCountries[index].name}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: kprimary,
                                ),
                              ),
                              Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: _currenctIndex == index
                                      ? kprimary
                                      : Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey[400]!),
                                ),
                                alignment: Alignment.center,
                                child: _currenctIndex == index
                                    ? const HugeIcon(
                                        icon: HugeIcons.strokeRoundedTick02,
                                        color: Colors.white,
                                        size: 10.0,
                                      )
                                    : const SizedBox.shrink(),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )),
                ]);
          }),
        );
      },
    );
  }
}
