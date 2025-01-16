// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:kori_etu/config/theme/style.dart';

// ignore: must_be_immutable
class KoriDropdownMenu<T> extends StatelessWidget {
  KoriDropdownMenu({
    super.key,
    required this.labelText,
    required this.items,
    required this.dropdownMenuEntries,
    this.onSelected,
  });

  final String labelText;

  final List<T> items;

  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  void Function(T?)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: kborderInput),
        DropdownMenu<T>(
          width: double.infinity,
          textStyle: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
            labelStyle: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
            fillColor: Colors.white,
            filled: true,
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
          trailingIcon: const Icon(
            HugeIcons.strokeRoundedArrowDown01,
            color: Colors.black,
          ),
          initialSelection: items.first,
          onSelected: onSelected,
          dropdownMenuEntries: dropdownMenuEntries,
        )
      ],
    );
  }
}
