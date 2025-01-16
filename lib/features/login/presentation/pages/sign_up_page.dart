import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kori_etu/components/input_text_form_filed.dart';
import 'package:kori_etu/components/phone_text_input_form.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/features/login/presentation/widgets/link_to_create_account.dart';
import 'package:kori_etu/features/login/presentation/widgets/login_app_bar_custom.dart';
import 'package:kori_etu/features/login/presentation/widgets/social_media_icon.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                "Getting Started",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
              Text(
                "Create an account to continue !",
                style: TextStyle(color: Colors.grey[400]),
              ),
              SizedBox(height: SizeConfig.blockHorizontal! * 20),
              InputTextFormFiled(
                labelText: "Email",
                hintText: "exemple@gmail.com",
              ),
              const SizedBox(height: 25),
              const PhoneTextInputForm(),
              const SizedBox(height: 25),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                    activeColor: kprimary,
                  ),
                  Expanded(
                    child: RichText(
                        text: const TextSpan(
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: ksecondFont,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'By creating a new account , you agree to ',
                          style: TextStyle(
                            fontSize: 16,
                            color: kLink,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: 'our Terms ',
                          style: TextStyle(
                            fontSize: 16,
                            color: kLink,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: 'and ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: 'Conditions!',
                          style: TextStyle(
                            fontSize: 16,
                            color: kLink,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              PrimaryButton(
                labelButton: "Sign up",
                vertical: 0,
                // textStyle: const TextStyle(),
                onPressed: () {
                  context.push(CONFIRMEMAIL);
                },
              ),
              const SizedBox(height: 20),
              LinkToCreateAccount(
                firstText: 'Already have an account ?  ',
                secondText: 'Login',
                onTap: () {
                  context.push(LOGIN);
                },
              ),
              SizedBox(height: SizeConfig.blockHorizontal! * 40),
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
              const SizedBox(height: 20),
              const SocialMediaIcon(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
