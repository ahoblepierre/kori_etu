import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/components/kori_graduate_app_bar.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';

// ignore: must_be_immutable
class IdentificationSecondePage extends StatelessWidget {
  const IdentificationSecondePage({super.key});

  @override
  Widget build(BuildContext context) {
    /// confi size
    SizeConfig().init(context);

    return Scaffold(
      appBar: const KoriGraduateAppBar(grade: 0.6),

      /// Body
      body: SafeArea(
        minimum: const EdgeInsets.all(kborder),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Carte national d'identité  (CNI)",
              style: koriTextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            SizedBox(height: SizeConfig.blockHorizontal! * 5),
            Text(
              "Scannez le recto de la carte d'identité avec l'appareil photo.",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 17),
            ),
            SizedBox(height: SizeConfig.blockHorizontal! * 5),
            const ChoiceImage(imagePath: "assets/images/recto.png"),
            SizedBox(height: SizeConfig.blockHorizontal! * 5),
            Text(
              "Scannez le verso de la carte d'identité avec l'appareil photo.",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 17),
            ),
            const ChoiceImage(imagePath: "assets/images/verso.png"),
            const Spacer(),
            PrimaryButton(
              labelButton: "Suivant",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ChoiceImage extends StatelessWidget {
  const ChoiceImage({
    super.key,
    required this.imagePath,
  });
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Center(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: SizeConfig.screenWidth! * 0.75,
          ),
        ),
        const Align(
          alignment: AlignmentDirectional(0.8, 10),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: kprimary,
            child: Icon(
              HugeIcons.strokeRoundedCamera02,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
