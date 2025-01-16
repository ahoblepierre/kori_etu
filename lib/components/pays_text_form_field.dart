import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ip_country_lookup/ip_country_lookup.dart';
import 'package:kori_etu/components/input_text_form_filed.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/resources/country.dart';
import 'package:logger/logger.dart';

class PaysTextFormField extends StatefulWidget {
  const PaysTextFormField({
    super.key,
    this.controller,
    this.onCountryChange,
  });

  final TextEditingController? controller;
  final void Function(Country)? onCountryChange;

  @override
  State<PaysTextFormField> createState() => _PaysTextFormFieldState();
}

class _PaysTextFormFieldState extends State<PaysTextFormField> {
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
    // TODO: implement initState
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
      widget.onCountryChange?.call(countryFound);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        _displayBottomSheet(context);
      },
      child: Align(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: SizeConfig.blockVertical! * 2),
            Container(
              height: SizeConfig.blockVertical! * 4,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: ksecondary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const HugeIcon(
                    icon: HugeIcons.strokeRoundedLocation10,
                    color: Colors.black,
                    size: 15.0,
                  ),
                  SizedBox(width: SizeConfig.blockHorizontal! * 2.5),
                  Flexible(
                    child: Text(
                      "${_selectedValue.flag}  ${_selectedValue.name}",
                      style: koriTextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.blockHorizontal! * 3.5,
                      ),
                    ),
                  ),
                  const HugeIcon(
                    icon: HugeIcons.strokeRoundedArrowDown01,
                    color: kprimary,
                    size: 24.0,
                  )
                ],
              ),
            ),
          ],
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
                          koriAppCountries = List.from(countries);
                        } else {
                          final searchList = countries
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
                      Logger().i(koriAppCountries);
                    },
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
                            _selectedValue = koriAppCountries[index];
                            _currenctIndex = index;
                            widget.controller?.text = _selectedValue.name;
                            widget.onCountryChange?.call(_selectedValue);
                            koriAppCountries = List.from(countries);
                            Logger().i(index);
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
