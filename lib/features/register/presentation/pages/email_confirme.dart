// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/config/routes/route_name.dart';

import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/constants/constants.dart';
import 'package:kori_etu/core/resources/scaffold_message_enum.dart';
import 'package:kori_etu/core/services/storage_service.dart';
import 'package:kori_etu/core/utils/utils.dart';
import 'package:kori_etu/features/register/data/models/register_user.dart';
import 'package:kori_etu/features/register/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:kori_etu/features/register/presentation/widgets/register_app_bar.dart';

class EmailConfirme extends StatefulWidget {
  const EmailConfirme({
    super.key,
  });
  @override
  State<EmailConfirme> createState() => _EmailConfirmeState();
}

class _EmailConfirmeState extends State<EmailConfirme> {
  String? email;
  RegisterUser? user;
  Map<String, dynamic>? userParameter;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Récupérer les query parameters depuis le contexte
    final state = GoRouterState.of(context);
    email = state.uri.queryParameters['email'];

    /// stocker l'email
    StorageService().setCache(
      authEmail,
      email,
    );

    /// recuperer les query parameters
    // final userJson = state.uri.queryParameters['user'];
    // if (userJson != null ) {
    //   final Map<String, dynamic> userMap = jsonDecode(userJson);
    //   user = RegisterUser.fromJson(userMap);
    // }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocProvider(
      create: (context) =>
          GetIt.I<RegisterBloc>()..add(const InitialEmailEvent()),
      child: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: kespacing),
          child: BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterError) {
                koriScaffoldMessage(
                  context,
                  state.errorMessage,
                  statut: Statut.ERROR,
                );
              }
              if (state is RegisterSessionSuccess) {
                koriScaffoldMessage(
                  context,
                  "Email de vérificarion envoyé avec succès",
                  statut: Statut.SUCCESS,
                );
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RegisterAppBar(time: 0.5),
                SizedBox(height: SizeConfig.blockHorizontal! * 5),
                Text(
                  "Vérifiez votre adresse email",
                  style: koriTextStyle(
                    fontSize: SizeConfig.blockHorizontal! * 7,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: SizeConfig.blockHorizontal! * 5),
                Text(
                  "Un mail vous a été envoyé pour verifier votre identité",
                  style: koriTextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: ksecondFont,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: SizeConfig.blockHorizontal! * 5),
                Center(
                  child: Image.asset("assets/images/verification_email.png"),
                ),
                Text(
                  "Cliquez sur le lien de vérification par e-mail qui vous a été envoyé sur $email",
                  style: const TextStyle(fontFamily: ksecondFont),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                PrimaryButton(
                  labelButton: "Open my email",
                  textStyle: const TextStyle(),
                  onPressed: () {
                    context.pushNamed(
                      EMAILVERIFIED,
                      pathParameters: {
                        "token": "PIERRE AHOBLE"
                        // "token": StorageService().getCache(emailTokenValidite)
                      },
                    );
                  },
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    if (state is InitialVerifyEmailState) {
                      return Center(
                        child: Column(
                          children: [
                            const Text(
                              "Vous n'avez pas encore reçu l'email ?",
                              style: TextStyle(fontFamily: ksecondFont),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "veuillez vérifier vos spams ou",
                                  style: TextStyle(
                                    fontFamily: ksecondFont,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.read<RegisterBloc>().add(
                                          ReSendEmailEvent(user!),
                                        );
                                  },
                                  child: const Text(
                                    " renvoyé ",
                                    style: TextStyle(
                                      color: kprimary,
                                      fontFamily: ksecondFont,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const HugeIcon(
                                  icon: HugeIcons.strokeRoundedMail01,
                                  color: kprimary,
                                  size: 15.0,
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }
                    return const Center();
                  },
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
