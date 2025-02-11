// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:image_picker/image_picker.dart';

import 'package:kori_etu/components/kori_graduate_app_bar.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/services/storage_service.dart';

// ignore: must_be_immutable
class IdentificationSecondePage extends StatefulWidget {
  const IdentificationSecondePage({super.key});

  @override
  State<IdentificationSecondePage> createState() =>
      _IdentificationSecondePageState();
}

class _IdentificationSecondePageState extends State<IdentificationSecondePage> {
  File? rectoPath;
  File? versoPath;

  final ImagePicker _picker = ImagePicker();

  bool isLoading = false;

  Future<void> _pickImageRecto(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        rectoPath = File(pickedFile.path); // Stocke le chemin du fichier
      });
    }
  }

  Future<void> _pickImageVerso(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        versoPath = File(pickedFile.path); // Stocke le chemin du fichier
      });
    }
  }

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
            ChoiceImage(
              imagePath: "assets/images/recto.png",
              image: rectoPath,
              onClick: () {
                _pickImageRecto(ImageSource.gallery);
              },
            ),
            SizedBox(height: SizeConfig.blockHorizontal! * 5),
            Text(
              "Scannez le verso de la carte d'identité avec l'appareil photo.",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 17),
            ),
            ChoiceImage(
              imagePath: "assets/images/verso.png",
              image: versoPath,
              onClick: () {
                _pickImageVerso(ImageSource.gallery);
              },
            ),
            const Spacer(),
            PrimaryButton(
              isLoading: isLoading,
              labelButton: "Suivant",
              onPressed: () {
                StorageService().setCompleteKYC();
                setState(() {
                  isLoading = true;
                });

                Future.delayed(const Duration(seconds: 5), () {
                  if (!context.mounted) return;
                  context.pushReplacementNamed(DASHBOARD);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ChoiceImage extends StatelessWidget {
  ChoiceImage({
    super.key,
    required this.imagePath,
    required this.onClick,
    this.image,
  });
  final String imagePath;
  final VoidCallback onClick;
  File? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Center(
          child: image != null
              ? Image.file(
                  image!,
                  fit: BoxFit.contain,
                  width: SizeConfig.screenWidth! * 0.75,
                  height: SizeConfig.screenWidth! * 0.50,
                )
              : Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: SizeConfig.screenWidth! * 0.75,
                ),
        ),
        Align(
          alignment: const AlignmentDirectional(0.8, 10),
          child: GestureDetector(
            onTap: onClick,
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: kprimary,
              child: Icon(
                HugeIcons.strokeRoundedCamera02,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
