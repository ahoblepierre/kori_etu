import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/components/secondary_button.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/resources/onboarding_model.dart';
import 'package:kori_etu/features/login/presentation/pages/login_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingOld extends StatefulWidget {
  const OnboardingOld({super.key});

  @override
  State<OnboardingOld> createState() => _OnboardingOldState();
}

class _OnboardingOldState extends State<OnboardingOld> {
  final PageController _pageController = PageController(initialPage: 0);

  final List<OnboardingModel> items = [
    OnboardingModel(
      title: "Managing your money is about to get a lot better",
      image: 'assets/images/2.png',
    ),
    OnboardingModel(
      title: "The most Secoure Platform for customer",
      image: 'assets/images/1.png',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ksecondaryLigth,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: kborder + 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: kprimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Image.asset("assets/images/kori_logo_text.png"),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: SizeConfig.screenheigth! * 0.5,
              child: PageView.builder(
                controller: _pageController,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 200,
                    height: 100,
                    child: Column(
                      children: [
                        Image.asset(items[index].image),
                        const SizedBox(height: 10),
                        Text(
                          items[index].title,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController, // PageController
              count: items.length,
              effect: ExpandingDotsEffect(
                dotColor: Colors.grey.shade300,
                activeDotColor: kprimary,
              ), // your preferred effect
              onDotClicked: (index) {},
            ),
            const Spacer(),
            PrimaryButton(
              labelButton: "Login",
              vertical: 0,
              textStyle: const TextStyle(),
              onPressed: () {
                context.push(LOGIN);
              },
            ),
            SecondaryButton(
              labelButton: "Create an account",
              onPressed: () {
                context.push(SINGUP);
              },
            ),
          ],
        ),
      ),
    );
  }
}
