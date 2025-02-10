import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/features/introduction/presentation/bloc/onboarding_bloc.dart';
import 'package:kori_etu/features/introduction/presentation/widgets/change_language_widget.dart';

class OnboardingEnd extends StatelessWidget {
  const OnboardingEnd({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kprimary,
      body: SafeArea(
          child: BlocProvider(
        create: (context) => BlocProvider.of<OnboardingBloc>(context),
        child: BlocListener<OnboardingBloc, OnboardingState>(
          listener: (context, state) {
            if (state is OnboardingCompletedState) {
              context.pushNamed(REGISTER);
            }
          },
          listenWhen: (previous, current) =>
              current is OnboardingGetStarted ||
              current is OnboardingCompletedState,
          child: Column(
            children: [
              // const ChangeLanguageWidget(color: Colors.white),
              SizedBox(height: SizeConfig.blockVertical! * 5),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(kespacing),
                width: double.infinity,
                height: SizeConfig.screenheigth! * 0.50,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/cercle_blanc_jaune.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Text(
                      "Welcome to Kori , Proudly African",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kprimary,
                        fontSize: SizeConfig.blockHorizontal! * 6.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Create an account or log in to access you services and manage your funds with ease",
                      style: koriTextStyle(
                        color: kprimary,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    BlocBuilder<OnboardingBloc, OnboardingState>(
                      builder: (context, state) {
                        return PrimaryButton(
                          isLoading: state is OnboardingGetStarted,
                          labelButton: "Commencer",
                          onPressed: () {
                            context.read<OnboardingBloc>().add(
                                  OnboardingStartedEvent(),
                                );
                          },
                        );
                      },
                    ),
                    SizedBox(height: SizeConfig.blockHorizontal! * 6.5),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
