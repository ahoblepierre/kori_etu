// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/components/kori_loading.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/resources/scaffold_message_enum.dart';
import 'package:kori_etu/core/utils/utils.dart';
import 'package:kori_etu/features/login/presentation/bloc/bloc_code_pin/code_pin_bloc.dart';
import 'package:kori_etu/features/login/presentation/widgets/pin_indicators.dart';
import 'package:kori_etu/features/register/presentation/widgets/register_app_bar.dart';
import 'package:logger/logger.dart';

class SetPinCode extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SetPinCodeState createState() => _SetPinCodeState();
}

class _SetPinCodeState extends State<SetPinCode>
    with SingleTickerProviderStateMixin {
  String pin = '';
  String correctPin = '1234'; // Le code PIN correct
  List<int> numbers = [];

  String firstCodePin = '';
  String secondCodePin = '';

  String pinInformaton = "Entrez un code PIN";

  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
    // List.generate(10, (i) => i)..shuffle();
    // ..shuffle();  Génère les chiffres de 0 à 9 de manière aléatoire

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0.0, 0.1),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kscaffoldBackgroundColor,
      body: BlocProvider(
        create: (context) => GetIt.I<CodePinBloc>(),
        child: BlocListener<CodePinBloc, CodePinState>(
          listener: (context, state) {
            if (state is SetCodePinState) {
              pin = '';
              firstCodePin = state.code;
              pinInformaton = "Confirmer le code PIN";
              Logger().i("je suis entrer le code PIN");
            }
            if (state is ErreurCodePinInitialState) {
              pinInformaton = "Entrez un code PIN";
              pin = '';
            }
            if (state is ErreurCodePinState) {
              koriScaffoldMessage(context, state.message, statut: Statut.ERROR);
            }
            if (state is CodePinSuccessState) {
              context.pushNamed(BIOMETRIC);
            }
            if (state is ErreurCodePinInitialState) {
              koriScaffoldMessage(
                context,
                "Les codes PIN ne correspondent pas",
                statut: Statut.ERROR,
              );
            }
          },
          child: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: kespacing),
            child: BlocBuilder<CodePinBloc, CodePinState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RegisterAppBar(time: 0.5),
                    SizedBox(height: SizeConfig.blockHorizontal! * 5),
                    Text(
                      pinInformaton,
                      style: koriTextStyle(
                        fontSize: SizeConfig.blockHorizontal! * 7,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Veuillez saisir un code PIN pour sécuriser l'accès à votre compte",
                      style: koriTextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: ksecondFont,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockHorizontal! * 30),
                    // Spacer(),
                    SlideTransition(
                      position: _animation,
                      child: PinIndicators(pin: pin),
                    ),
                    BlocBuilder<CodePinBloc, CodePinState>(
                      builder: (context, state) {
                        if (state is CodePinLoadingState) {
                          return const KoriLoading();
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    SizedBox(height: SizeConfig.blockVertical! * 4),
                    _buildNumberPad(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNumberPad() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 12, // 10 chiffres + 1 supprimer + 1 confirmer
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 0,
        mainAxisSpacing: 15,
        childAspectRatio: 1.7,
      ),
      itemBuilder: (context, index) {
        if (index == 10) {
          return _buildNumberButton(numbers.last, () {
            setState(() {
              if (pin.length < 6) {
                pin += numbers[index - 1].toString();
              }
              if (pin.length == 6 && firstCodePin.isEmpty) {
                context
                    .read<CodePinBloc>()
                    .add(SetFirstCodePinEvent(enteredCode: pin));
              } else if (firstCodePin.isNotEmpty && pin.length == 6) {
                if (pin == firstCodePin) {
                  context.read<CodePinBloc>().add(
                        AuthWithCodePinEvent(enteredCode: pin),
                      );
                } else {
                  context.read<CodePinBloc>().add((ErreurCodePinEvent()));
                  setState(() {
                    pin = '';
                    firstCodePin = '';
                  });
                }
              }
            });
          }); // Position de 0
        }
        if (index == 9) return const SizedBox.shrink(); // Touche confirmer
        // if (index == 9) return _buildConfirmButton(); // Touche confirmer
        if (index == 11) return _buildDeleteButton(); // Touche supprimer

        return _buildNumberButton(numbers[index], () {
          setState(() {
            if (pin.length < 6) {
              pin += numbers[index].toString();
            }
            if (pin.length == 6 && firstCodePin.isEmpty) {
              context
                  .read<CodePinBloc>()
                  .add(SetFirstCodePinEvent(enteredCode: pin));
            } else if (firstCodePin.isNotEmpty && pin.length == 6) {
              if (pin == firstCodePin) {
                context.read<CodePinBloc>().add(
                      AuthWithCodePinEvent(enteredCode: pin),
                    );
              } else {
                context.read<CodePinBloc>().add((ErreurCodePinEvent()));
                setState(() {
                  pin = '';
                  firstCodePin = '';
                });
              }
            }
          });
        }); // Autres chiffres
      },
    );
  }

  Widget _buildNumberButton(int number, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              number.toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontFamily: ksecondFont,
                color: kprimary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (pin.isNotEmpty) {
            pin = pin.substring(0, pin.length - 1);
          }
        });
      },
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: const HugeIcon(
          icon: HugeIcons.strokeRoundedArrowLeft01,
          color: kprimary,
          size: 30.0,
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _buildConfirmButton() {
    return GestureDetector(
      onTap: () {
        if (pin == correctPin) {
          _showDialog('Succès', 'Code PIN correct !');
        } else {
          _showDialog('Erreur', 'Code PIN incorrect, réessayez.');
          setState(() {
            pin = ''; // Réinitialiser le PIN
          });
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.greenAccent,
        ),
        child: const Center(
          child: Icon(Icons.check, size: 24),
        ),
      ),
    );
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
