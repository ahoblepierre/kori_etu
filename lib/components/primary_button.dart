import 'package:flutter/material.dart';
import 'package:kori_etu/components/diseable_button.dart';
import 'package:kori_etu/components/loading.dart';
import 'package:kori_etu/config/theme/style.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    super.key,
    this.textStyle,
    this.vertical = 0,
    this.onPressed,
    this.labelButton = "Get started",
    this.isLoading = false,
  });

  final TextStyle? textStyle;
  double vertical = 0;
  final VoidCallback? onPressed;

  final String labelButton;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return onPressed == null
        ? DiseableButton(labelButton: labelButton, textStyle: textStyle)
        : Visibility(
            replacement: const Loading(),
            visible: !isLoading,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: onPressed,
                style: ButtonStyle(
                  padding: WidgetStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(horizontal: .0, vertical: 12.0),
                  ),
                  backgroundColor: WidgetStateProperty.all<Color>(kprimary),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kborder),
                    ),
                  ),
                  elevation: WidgetStateProperty.all<double>(5.0),
                ),
                child: Text(
                  labelButton,
                  style: textStyle ??
                      const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17.0,
                      ),
                ),
              ),
            ),
          );
  }
}
