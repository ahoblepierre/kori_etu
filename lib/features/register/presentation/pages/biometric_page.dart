import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/resources/scaffold_message_enum.dart';
import 'package:kori_etu/core/utils/utils.dart';
import 'package:kori_etu/features/register/presentation/bloc/active_biometric_bloc/active_biometric_bloc.dart';
import 'package:kori_etu/features/register/presentation/widgets/register_app_bar.dart';

class BiometricPage extends StatelessWidget {
  const BiometricPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: BlocProvider(
        create: (context) => GetIt.I<ActiveBiometricBloc>(),
        child: BlocListener<ActiveBiometricBloc, ActiveBiometricState>(
          listener: (context, state) {
            if (state is ActiveBiometricLoaded) {
              Navigator.of(context).pop();
            }
            if (state is ActiveBiometricSucces) {
              koriScaffoldMessage(context, "Biometrie activé avec succès");

              context.pushNamed(SINGUPFIRST);
            }
            if (state is ActiveBiometricError) {
              koriScaffoldMessage(context, state.message, statut: Statut.ERROR);
            }
          },
          child: BlocBuilder<ActiveBiometricBloc, ActiveBiometricState>(
            builder: (context, state) {
              return SafeArea(
                minimum: const EdgeInsets.symmetric(horizontal: kespacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RegisterAppBar(time: 0.5),
                    SizedBox(height: SizeConfig.blockHorizontal! * 5),
                    Text(
                      "Biometrics",
                      style: koriTextStyle(
                        fontSize: SizeConfig.blockHorizontal! * 7,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockHorizontal! * 5),
                    Text(
                      "Protégez votre compte en un seul geste ! Activez la biométrie ou Face ID pour une sécurité optimale",
                      style: koriTextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: ksecondFont,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Center(child: Image.asset("assets/images/face_id.png")),
                    const Spacer(),
                    PrimaryButton(
                      isLoading: state is ActiveBiometricLoaded,
                      labelButton: "Activer maintenat",
                      onPressed: () {
                        koriDialog(
                          context,
                          height: SizeConfig.screenWidth! * 0.55,
                          title:
                              " Souhaitez-vous autoriser ''Kori App'' à utiliser Face ID ?",
                          subtitle:
                              'Cela vous permet de vous connecter pour passer au paiement avec Face ID',
                          actionText: "D'accord",
                          cancellText: "Ne pas autoriser",
                          onSubmit: () {
                            context.read<ActiveBiometricBloc>().add(
                                  ActiveBiometricLaunchEvent(),
                                );
                          },
                          onDismiss: () {
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ),
                    SizedBox(height: SizeConfig.blockHorizontal! * 2),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          context.pushNamed(SINGUPFIRST);
                        },
                        child: Text(
                          "Pas maintenant",
                          style: koriTextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockHorizontal! * 2),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
