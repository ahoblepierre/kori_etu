import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/features/register/presentation/bloc/welcome/welcome_bloc.dart';

class WelcomeEtudiantPage extends StatelessWidget {
  const WelcomeEtudiantPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => WelcomeBloc(),
      child: Scaffold(
        body: BlocListener<WelcomeBloc, WelcomeState>(
          listener: (context, state) {
            // if (state is GoToViewState && state.profil == 1) {
            //   context.go("/$DASHBOARDETUDIANT");
            // } else {
            //   context.go("/$DASHBOARDPARENT");
            // }
          },
          child: SafeArea(
            minimum: const EdgeInsets.all(kborder),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //  KoriCircularProgressIndicator(),

                Image.asset("assets/images/kori_logo_round.png"),
                SizedBox(height: SizeConfig.blockHorizontal! * 10),
                const Text(
                  "Bienvenue sur Kori",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Text(
                  "Sélectionner une action pour commencer !",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.blockHorizontal! * 15),
                PrimaryButton(
                  labelButton: "Acceder à mon wallet Kori",
                  onPressed: () {
                    context.goNamed(DASHBOARDETUDIANT);
                  },
                ),
                SizedBox(height: SizeConfig.blockHorizontal! * 5),
                PrimaryButton(
                  labelButton: "Activer / Commander une carte",
                  onPressed: () {},
                ),
                SizedBox(height: SizeConfig.blockHorizontal! * 5),
                PrimaryButton(
                  labelButton: "Mettre à jour mon profil",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
