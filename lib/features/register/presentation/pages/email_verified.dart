// ignore_for_file: public_member_api_docs, sort_constructors_first
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
import 'package:kori_etu/features/register/presentation/bloc/email_verified/bloc/email_verified_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logger/logger.dart';

class EmailVerified extends StatefulWidget {
  const EmailVerified({
    super.key,
    required this.token,
  });

  final String token;

  @override
  State<EmailVerified> createState() => _EmailVerifiedState();
}

class _EmailVerifiedState extends State<EmailVerified> {
  // final EmailVerifiedBloc emailVerifiedBloc =
  //     GetIt.instance<EmailVerifiedBloc>();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // emailVerifiedBloc.add(EmailVerifiedFectchEvent(token: widget.token));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: BlocProvider<EmailVerifiedBloc>(
        create: (context) => GetIt.I<EmailVerifiedBloc>()
          ..add(EmailVerifiedFectchEvent(token: widget.token)),
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: kespacing),
          child: BlocListener<EmailVerifiedBloc, EmailVerifiedState>(
            listener: (context, state) {
              if (state is EmailVerifiedInitial) {
                Logger().i("EmailVerifiedInitial");
              }
              if (state is EmailVerifiedError) {
                koriScaffoldMessage(context, state.errorMessage,
                    statut: Statut.ERROR);
              }
            },
            listenWhen: (previous, current) =>
                current is EmailVerifiedInitial ||
                current is EmailVerifiedError ||
                current is EmailVerifiedSucces,
            child: BlocBuilder<EmailVerifiedBloc, EmailVerifiedState>(
              builder: (context, state) {
                if (state is EmailVerifiedInitial) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: SizeConfig.blockHorizontal! * 5),
                      Text(
                        "Email en cours de vérificarion",
                        style: koriTextStyle(
                          fontSize: SizeConfig.blockHorizontal! * 7,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: LoadingAnimationWidget.threeArchedCircle(
                          color: kprimary,
                          size: 50,
                        ),
                      ),
                      Text(
                        "Votre email est en cours de vérification, Patientez ...",
                        style: koriTextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: ksecondFont,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                    ],
                  );
                }
                if (state is EmailVerifiedError) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Center(
                          child:
                              Image.asset("assets/images/email_verified.png")),
                      Text(
                        "Echec de la vérification du email",
                        style: koriTextStyle(
                          fontSize: SizeConfig.blockHorizontal! * 5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        state.errorMessage.toString(),
                        style: koriTextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: ksecondFont,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: SizeConfig.blockHorizontal! * 5),
                      const Spacer(),
                    ],
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Center(
                        child: Image.asset("assets/images/email_verified.png")),
                    Text(
                      "Email verified",
                      style: koriTextStyle(
                        fontSize: SizeConfig.blockHorizontal! * 7,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Your email has been verified. Click the button to secure the account",
                      style: koriTextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: ksecondFont,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    BlocBuilder<EmailVerifiedBloc, EmailVerifiedState>(
                      builder: (context, state) {
                        if (state is EmailVerifiedSucces) {
                          final profil = state.profil;
                          if (profil.enabled) {
                            return PrimaryButton(
                              labelButton: "Connectez-vous",
                              textStyle: const TextStyle(),
                              onPressed: () {
                                context.pushNamed(LOGIN);
                              },
                            );
                          } else {
                            return PrimaryButton(
                              isLoading: isLoading,
                              labelButton: "Create you PIN",
                              textStyle: const TextStyle(),
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                });
                                Future.delayed(const Duration(seconds: 3), () {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  if (!context.mounted) return;
                                  context.pushNamed(SETPINCODE);
                                });
                              },
                            );
                          }
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    SizedBox(height: SizeConfig.blockHorizontal! * 5),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
