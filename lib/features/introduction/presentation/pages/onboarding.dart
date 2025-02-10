import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/resources/onboarding_model.dart';
import 'package:kori_etu/features/introduction/presentation/widgets/change_language_widget.dart';
import 'package:kori_etu/features/introduction/presentation/widgets/onboarding_Iconbutton.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});

  final PageController _pageController = PageController(initialPage: 0);

  final List<OnboardingModel> items = [
    OnboardingModel(
        title: "Top up your cards in just one click !",
        image: 'assets/images/cercle_bleu.png',
        subTitle:
            "Access a flexible wallet to instantly top up your cards via multiple methods"),
    OnboardingModel(
      title: "Master your finances",
      image: 'assets/images/cercle_bleu.png',
      subTitle:
          "Easily manage your funds with quick and secure transferts between .",
    ),
    OnboardingModel(
      title: "Total control, whereever you are.",
      image: 'assets/images/cercle_bleu.png',
      subTitle:
          "With the parental control feature, monitor, block or top up your loved ones' cards at any time securely .",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        // systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ksecondaryLigth,
      body: SafeArea(
        child: Column(
          children: [
            // const ChangeLanguageWidget(),
            const Spacer(),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/cercle_bleu.png"),
                  fit: BoxFit.cover,
                ),
              ),
              // height: SizeConfig.screenheigth! * 0.5,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: kespacing),
                    height: SizeConfig.screenheigth! * 0.5,
                    child: PageView.builder(
                        controller: _pageController,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: kespacing * 2),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: Image.asset(
                                    "assets/images/kori_logo.png",
                                  ),
                                ),
                                const SizedBox(height: kespacing * 3),
                                SmoothPageIndicator(
                                  controller: _pageController, // PageController
                                  count: items.length,
                                  effect: const ExpandingDotsEffect(
                                    strokeWidth: 10,
                                    dotColor: Colors.white,
                                    activeDotColor: ksecondary,
                                    dotWidth: 10,
                                    dotHeight: 5,
                                  ), // your preferred effect
                                  onDotClicked: (index) {},
                                ),
                                const SizedBox(height: kespacing),
                                Text(
                                  items[index].title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: SizeConfig.blockHorizontal! * 5.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: kespacing),
                                Text(
                                  items[index].subTitle!,
                                  style: koriTextStyle(
                                    color: Colors.white,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OnboardingIcoButton(
                        icon: HugeIcons.strokeRoundedArrowLeft01,
                        onPressed: () {
                          _pageController.previousPage(
                            curve: Curves.bounceInOut,
                            duration: const Duration(milliseconds: 300),
                          );
                        },
                      ),
                      OnboardingIcoButton(
                        isColor: true,
                        onPressed: () {
                          if (_pageController.page == items.length - 1) {
                            context.pushNamed(ONBOARDINGEND);
                          } else {
                            _pageController.nextPage(
                              curve: Curves.bounceInOut,
                              duration: const Duration(milliseconds: 300),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
