import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/components/kori_loading.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/resources/scaffold_message_enum.dart';
import 'package:kori_etu/core/utils/utils.dart';
import 'package:kori_etu/features/register/presentation/bloc/update_profil_bloc/update_profil_bloc.dart';
import 'package:kori_etu/features/register/presentation/widgets/register_app_bar.dart';

class RegisterFirst extends StatelessWidget {
  RegisterFirst({super.key});

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: kespacing),
        child: BlocListener<UpdateProfilBloc, UpdateProfilState>(
          listener: (context, state) {
            if (state is UpdateProfilSuccessState) {
              context.goNamed(WELCOMEPARENT);
            }
            if (state is UpdateProfilFailureState) {
              koriScaffoldMessage(context, state.error, statut: Statut.ERROR);
            }
          },
          listenWhen: (previous, current) =>
              current is UpdateProfilLoadingState ||
              current is UpdateProfilFailureState ||
              current is UpdateProfilSuccessState,
          child: Column(
            children: [
              Column(
                children: [
                  const RegisterAppBar(),
                  SizedBox(height: SizeConfig.blockHorizontal! * 5),
                  Text(
                    "Comment allez vous utilisez Kori ?",
                    style: koriTextStyle(
                      fontSize: SizeConfig.blockHorizontal! * 7,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockHorizontal! * 5),
                  BlocBuilder<UpdateProfilBloc, UpdateProfilState>(
                    builder: (context, state) {
                      if (state is UpdateProfilLoadingState) {
                        return const KoriLoading();
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  RegisterFirstCard(
                    // title: " Pour recevoir des fonds",
                    title: "Je suis étudiant",
                    imagePath: "assets/images/etudiant.png",
                    subTitle:
                        "Idéal pour les étudiants en Occident souhaitant recevoir de l’argent de leurs proches avec des notifications en temps réel.",
                    onTap: () {
                      context.read<UpdateProfilBloc>().add(
                            const UpdateProfilLoadingEvent(),
                          );
                    },
                  ),
                  RegisterFirstCard(
                    // title: "Pour envoyer et recevoir de l’argent",
                    title: "je ne suis pas un étudiant",
                    imagePath: "assets/images/parent.png",
                    subTitle:
                        "Parfait pour envoyer de l’argent depuis l’Afrique ou l’Europe de manière simple et sécurisée.",
                    onTap: () {
                      context.read<UpdateProfilBloc>().add(
                            const UpdateProfilLoadParentingEvent(),
                          );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterFirstCard extends StatelessWidget {
  const RegisterFirstCard({
    super.key,
    required this.title,
    required this.subTitle,
    this.onTap,
    required this.imagePath,
  });
  final String title;
  final String subTitle;
  final Function()? onTap;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: SizeConfig.blockHorizontal! * 2.5,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockHorizontal! * 1.50,
        ),
        decoration: BoxDecoration(
            border: Border.all(color: kgrey.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(5.0, 5.0),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              const BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ),
            ]),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(vertical: SizeConfig.blockHorizontal! * 4),
          titleAlignment: ListTileTitleAlignment.center,
          leading: Image.asset(imagePath),
          trailing: HugeIcon(
            icon: HugeIcons.strokeRoundedArrowRight01,
            color: kprimary,
            size: SizeConfig.blockHorizontal! * 7,
          ),
          title: Text(
            title,
            style: koriTextStyle(
              fontSize: SizeConfig.blockHorizontal! * 3.5,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            subTitle,
            style: koriTextStyle(
              fontSize: SizeConfig.blockHorizontal! * 3,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
