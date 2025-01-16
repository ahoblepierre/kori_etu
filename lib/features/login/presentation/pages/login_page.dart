// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/components/kori_loading.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/resources/scaffold_message_enum.dart';
import 'package:kori_etu/core/utils/utils.dart';
import 'package:kori_etu/features/login/data/data_source/local_auth.dart';
import 'package:kori_etu/features/login/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:kori_etu/features/login/presentation/widgets/pin_indicators.dart';

class LoginPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  String pin = '';
  List<int> numbers = [];

  //local authentication
  final auth = LocalAuth();

  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    numbers = List.generate(10, (i) => i)..shuffle();
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

    auth.initDevice();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocProvider(
      create: (context) => BlocProvider.of<AuthBloc>(context),
      child: Scaffold(
        backgroundColor: kscaffoldBackgroundColor,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthErrorState) {
              pin = '';
              koriScaffoldMessage(context, state.error, statut: Statut.ERROR);
            }
            if (state is AuthSuccessState) {
              koriScaffoldMessage(context, "Connexion effectué avec succès");
              context.goNamed(DASHBOARD);
            }
          },
          child: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: kespacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: kborderColors, width: 1),
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: SizeConfig.blockVertical! * 10,
                      height: SizeConfig.blockVertical! * 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: kprimary, width: 2),
                      ),
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedLocked,
                        color: kprimary,
                        size: SizeConfig.blockVertical! * 5,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.blockVertical! * 2),
                Center(
                  child: Text(
                    'Hello !',
                    style: koriTextStyle(
                      fontSize: SizeConfig.blockVertical! * 3,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      // fontFamily: ""
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.blockVertical! * 2),
                Center(
                  child: Text(
                    "Entrez votre code pour vous connecter",
                    style: koriTextStyle(
                      color: Colors.grey.shade400,
                      fontFamily: ksecondFont,
                      fontSize: SizeConfig.blockVertical! * 2,
                    ),
                  ),
                ),
                const Spacer(),
                SlideTransition(
                  position: _animation,
                  child: PinIndicators(pin: pin),
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoadedState) {
                      return const KoriLoading();
                    }
                    return const SizedBox.shrink();
                  },
                ),
                SizedBox(height: SizeConfig.blockVertical! * 4),
                _buildNumberPad(),
                SizedBox(height: SizeConfig.blockVertical! * 2),
                Center(
                  child: TextButton(
                    onPressed: () {
                      context.pushNamed("BIOMETRIC");
                    },
                    child: Text(
                      "j'ai oublié mon code",
                      style: koriTextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.blockVertical! * 2),
              ],
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
          return _buildNumberButton(
            numbers.last,
            index,
            () {
              setState(() {
                if (pin.length < 6) {
                  pin += numbers[index - 1].toString();
                  if (pin.length == 6) {
                    context.read<AuthBloc>().add(AuthLoginEvent(pin));
                  }
                }
              });
            },
          );
        }
        if (index == 9) return const SizedBox.shrink();

        // {
        //   return _buildConfirmButton(
        //     () async {
        //       await auth.authenticate();
        //     },
        //   );
        // }
        // Touche confirmer
        if (index == 11) return _buildDeleteButton();
        return _buildNumberButton(
          numbers[index],
          index,
          () {
            setState(() {
              if (pin.length < 6) {
                pin += numbers[index].toString();
              }
              if (pin.length == 6) {
                context.read<AuthBloc>().add(AuthLoginEvent(pin));
              }
            });
          },
        ); // Autres chiffres
      },
    );
  }

  Widget _buildNumberButton(int number, int index, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            // border: Border.all(color: kprimary),
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
  Widget _buildConfirmButton(void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        child: Center(
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedFingerprintScan,
            color: kprimary,
            size: SizeConfig.blockHorizontal! * 15,
          ),
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
