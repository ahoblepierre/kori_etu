import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/utils/utils.dart';

// ignore: must_be_immutable
class InputTextFormFiled extends StatelessWidget {
  InputTextFormFiled({
    super.key,
    this.hintText = "Hintext",
    this.labelText = "LabelText",
    this.controller,
    this.keyboardType,
    this.suffixIcon,
    this.onChanged,
    this.prefixIcon,
    this.focusNode,
    this.inputFormatters,
  });

  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;

  final Function(String)? onChanged;

  List<TextInputFormatter>? inputFormatters;

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
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          keyboardType: keyboardType ?? TextInputType.text,
          inputFormatters: const [],
          onChanged: onChanged,
          validator: (value) {
            switch (keyboardType) {
              case TextInputType.text:
                if (value!.isEmpty) return "$labelText est obligatoire";
                break;
              case TextInputType.emailAddress:
                if (value!.isEmpty) return "$labelText est obligatoire";
                if (!validateEmail(value)) {
                  return "L'adresse email n'est pas valide";
                }
                break;
              default:
            }
            return null;
          },
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
            suffixIcon: suffixIcon ??
                const HugeIcon(
                  icon: HugeIcons.strokeRoundedMailAtSign02,
                  color: Colors.black,
                  size: 24.0,
                ),
            prefixIcon: prefixIcon,
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
        ),
      ],
    );
  }
}
