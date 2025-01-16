import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/resources/pays_widget_model.dart';
import 'package:kori_etu/core/utils/utils.dart';

class PhoneTextInputForm extends StatefulWidget {
  const PhoneTextInputForm({
    super.key,
  });

  @override
  State<PhoneTextInputForm> createState() => _PhoneTextInputFormState();
}

class _PhoneTextInputFormState extends State<PhoneTextInputForm> {
  PaysWidgetModel _selectedValue = PaysWidgetModel(
    indicatif: '+225',
    countryName: "Côte d'Ivoire",
    countryFlag: 'ci',
    countryCode: 'CI',
    isInternational: false,
    flag: '🇨🇮',
    maxLength: 10,
  );

  int _currenctIndex = 0;

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
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                flex: 3,
                child: TextFormField(
                  controller: TextEditingController(
                    text:
                        "${_selectedValue.flag} ${_selectedValue.countryCode}",
                  ),
                  readOnly: true,
                  onTap: () {
                    _displayBottomSheet(context);
                  },
                  decoration: InputDecoration(
                    labelText: '',
                    labelStyle: const TextStyle(fontSize: 20),
                    // suffixIcon: const HugeIcon(
                    //   icon: HugeIcons.strokeRoundedArrowDown01,
                    //   color: Colors.black,
                    //   size: 15.0,
                    // ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: kgrey),
                      borderRadius: BorderRadius.circular(kborderInput),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: kprimary),
                      borderRadius: BorderRadius.circular(kborderInput),
                    ),
                  ),
                )),
            const SizedBox(width: 10),
            Flexible(
              flex: 10,
              child: TextFormField(
                inputFormatters: [
                  generatePhoneFormatter(maxLength: _selectedValue.maxLength)
                ],
                decoration: InputDecoration(
                  labelText: 'Numéro de Téléphone',
                  hintText: "0X XX XX XX XX XX XX",
                  labelStyle: const TextStyle(fontSize: 15),
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                  suffixIcon: const HugeIcon(
                    icon: HugeIcons.strokeRoundedCall02,
                    color: kprimary,
                    size: 24.0,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  counter: const SizedBox.shrink(),
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
                ),
                //maxLength: 10,
                keyboardType: TextInputType.phone,
                onChanged: (value) {},
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a phone number.';
                  }
                  return null;
                },
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(25),
          height: SizeConfig.blockVertical! * 20 * africanCountries.length,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sélectionner le code pays',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Expanded(
                    child: ListView.builder(
                  itemCount: africanCountries.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedValue = africanCountries[index];
                          _currenctIndex = index;
                        });
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${africanCountries[index].flag}   ${africanCountries[index].countryName}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700),
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
      },
    );
  }
}
