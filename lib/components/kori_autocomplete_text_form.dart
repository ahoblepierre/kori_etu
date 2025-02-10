// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/theme/style.dart';

// ignore: must_be_immutable
class KoriAutocompleteTextForm<T extends Object> extends StatefulWidget {
  KoriAutocompleteTextForm({
    super.key,
    required this.optionsBuilder,
    this.onSelected,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    required this.controller,
    this.labelText,
    this.displayStringForOption = RawAutocomplete.defaultStringForOption,
  });

  // final List<T> items;
  final Future<Iterable<T>> Function(TextEditingValue) optionsBuilder;
  final void Function(T)? onSelected;
  final TextEditingController controller;
  final AutocompleteOptionToString<T> displayStringForOption;

  String? hintText;
  String? labelText;
  Widget? suffixIcon;
  Widget? prefixIcon;

  @override
  State<KoriAutocompleteTextForm<T>> createState() =>
      _KoriAutocompleteTextFormState<T>();
}

class _KoriAutocompleteTextFormState<T extends Object>
    extends State<KoriAutocompleteTextForm<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText ?? "Bénéficiaires :",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 10),
        Autocomplete<T>(
          optionsBuilder: widget.optionsBuilder,
          fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
            widget.controller.text = controller.text;
            return TextField(
              controller: controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                fillColor: kscaffoldBackgroundColor,
                filled: true,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
                suffixIcon: widget.suffixIcon ??
                    const HugeIcon(
                      icon: HugeIcons.strokeRoundedMailAtSign02,
                      color: Colors.black,
                      size: 24.0,
                    ),
                prefixIcon: widget.prefixIcon,
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
              onSubmitted: (value) {
                onFieldSubmitted();
              },
            );
          },
          onSelected: (option) {
            setState(() {
              widget.onSelected?.call(option);
            });
          },
          displayStringForOption: widget.displayStringForOption,
        ),
      ],
    );
  }
}
