import 'package:flutter/material.dart';
import 'package:kori_etu/components/input_text_form_filed.dart';
import 'package:kori_etu/components/phone_text_input_form.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/features/login/presentation/pages/sign_up_page.dart';
import 'package:kori_etu/features/login/presentation/widgets/link_to_create_account.dart';
import 'package:kori_etu/features/login/presentation/widgets/login_app_bar_custom.dart';
import 'package:kori_etu/features/login/presentation/widgets/social_media_icon.dart';

class LoginPageOld extends StatefulWidget {
  const LoginPageOld({super.key});

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  @override
  State<LoginPageOld> createState() => _LoginPageOldState();
}

class _LoginPageOldState extends State<LoginPageOld>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: kborder + 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginAppBarCustom(),
              const Text(
                "Hi, Welcome Back !",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
              Text(
                "Enter your email or phone number to sign in to your account.",
                style: TextStyle(color: Colors.grey[400]),
              ),
              SizedBox(height: SizeConfig.blockHorizontal! * 35),
              Container(
                decoration: const BoxDecoration(),
                height: SizeConfig.blockHorizontal! * 10,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 4.0,
                  isScrollable: true,
                  tabs: const [
                    Tab(child: Text("E-mail")),
                    Tab(child: Text("Numéro de téléphone"))
                  ],
                  controller: tabController,
                ),
              ),
              SizedBox(
                height: SizeConfig.blockHorizontal! * 70,
                child: TabBarView(controller: tabController, children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        InputTextFormFiled(
                          hintText: "kori@gmail.com",
                          labelText: "E-mail",
                        ),
                        const SizedBox(height: 20),
                        PrimaryButton(
                          labelButton: "Login",
                          textStyle: const TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 25),
                      const PhoneTextInputForm(),
                      const SizedBox(height: 20),
                      PrimaryButton(
                        labelButton: "Login",
                        textStyle: const TextStyle(),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ]),
              ),
              LinkToCreateAccount(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                firstText: "Don't have account ? ",
                secondText: ' Sign up',
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  const Flexible(child: Divider()),
                  const SizedBox(width: 10),
                  Text(
                    "Or continue with",
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  const SizedBox(width: 10),
                  const Flexible(child: Divider())
                ],
              ),
              const SizedBox(height: 10),
              const SocialMediaIcon()
            ],
          ),
        ),
      ),
    );
  }
}
