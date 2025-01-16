// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ip_country_lookup/ip_country_lookup.dart';
import 'package:kori_etu/components/input_text_form_filed.dart';

import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/resources/country.dart';
import 'package:kori_etu/core/utils/utils.dart';

// ignore: must_be_immutable
class TelephoneTextFormField extends StatefulWidget {
  TelephoneTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.countryCode,
  });
  final TextEditingController? controller;
  final FocusNode? focusNode;
  void Function(String)? countryCode;

  @override
  State<TelephoneTextFormField> createState() => _TelephoneTextFormFieldState();
}

class _TelephoneTextFormFieldState extends State<TelephoneTextFormField> {
  Country _selectedValue = const Country(
      name: "Côte d'Ivoire",
      flag: '🇨🇮',
      code: 'CI',
      dialCode: '225',
      nameTranslations: {},
      minLength: 10,
      maxLength: 10);

  int _currenctIndex = 0;

  List<Country> koriAppCountries = List.from(countries);

  @override
  void initState() {
    super.initState();
    searcheContry();
  }

  Future<void> searcheContry() async {
    final countryData = await IpCountryLookup().getIpLocationData();
    final countryFound = countries
        .where((el) =>
            el.code.toLowerCase() == countryData.country_code!.toLowerCase())
        .first;
    setState(() {
      _selectedValue = countryFound;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Numéro de téléphone",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: kespacing),
        TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          inputFormatters: [
            generatePhoneFormatter(maxLength: _selectedValue.maxLength - 1)
          ],
          decoration: InputDecoration(
            hintText: "0X XX XX XX XX XX XX",
            hintStyle: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kborder,
                vertical: kborder,
              ),
              child: GestureDetector(
                onTap: () => _displayBottomSheet(context),
                child: Text(
                  "${_selectedValue.flag} ${_selectedValue.code}",
                  style: const TextStyle(fontFamily: "Inter", color: kgrey),
                ),
              ),
            ),
            suffixIcon: const HugeIcon(
              icon: HugeIcons.strokeRoundedCall02,
              color: kprimary,
              size: 24.0,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            counter: const SizedBox.shrink(),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kgrey),
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
          ),
          keyboardType: TextInputType.phone,
          onChanged: (v) {
            setState(() {
              widget.countryCode?.call(_selectedValue.dialCode);
            });
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Numéro de téléphone obligatoire.';
            }
            return null;
          },
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
      ],
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
        return StatefulBuilder(builder: (context, setModalState) {
          return Container(
            padding: EdgeInsets.all(SizeConfig.blockHorizontal! * 5),
            height: SizeConfig.blockVertical! * 20 * countries.length,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InputTextFormFiled(
                    labelText: "Sélectionner votre pays",
                    hintText: "Rechercher ...",
                    prefixIcon: const HugeIcon(
                      icon: HugeIcons.strokeRoundedSearch01,
                      color: kprimary,
                      size: 20.0,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(kborder),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            color: kprimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    onChanged: (valueChange) {
                      setModalState(() {
                        if (valueChange.isEmpty) {
                          koriAppCountries = List.from(countries);
                        } else {
                          koriAppCountries = countries
                              .where((el) =>
                                  el.name
                                      .toLowerCase()
                                      .contains(valueChange.toLowerCase()) ||
                                  el.code
                                      .toLowerCase()
                                      .contains(valueChange.toLowerCase()))
                              .toList();
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                      child: ListView.builder(
                    itemCount: koriAppCountries.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedValue = koriAppCountries[index];
                            _currenctIndex = index;
                            koriAppCountries = List.from(countries);
                          });
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _currenctIndex == index
                                ? kprimary.withOpacity(0.3)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: kborder, horizontal: kborder),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${koriAppCountries[index].flag}   ${koriAppCountries[index].name}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
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
                ]),
          );
        });
      },
    );
  }
}
