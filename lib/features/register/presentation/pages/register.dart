import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ip_country_lookup/ip_country_lookup.dart';
import 'package:kori_etu/components/input_text_form_filed.dart';
import 'package:kori_etu/components/pays_text_form_field.dart';
import 'package:kori_etu/components/primary_button.dart';
import 'package:kori_etu/components/telephone_text_form_field.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/config/size_config.dart';
import 'package:kori_etu/config/theme/style.dart';
import 'package:kori_etu/core/resources/country.dart';
import 'package:kori_etu/core/resources/devce_info.dart';
import 'package:kori_etu/core/resources/scaffold_message_enum.dart';
import 'package:kori_etu/core/utils/utils.dart';
import 'package:kori_etu/core/utils/utils_function.dart';
import 'package:kori_etu/features/login/presentation/widgets/link_to_create_account.dart';
import 'package:kori_etu/features/login/presentation/widgets/social_media_icon.dart';
import 'package:kori_etu/features/register/data/models/register_user.dart';
import 'package:kori_etu/features/register/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:kori_etu/features/register/presentation/widgets/register_app_bar.dart';
import 'package:logger/logger.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

final _textEditingController = TextEditingController();
final FocusNode _focusNodeEmail = FocusNode();
final FocusNode _focusNodeTelephone = FocusNode();

bool showFirstField = true;

bool isLoading = false;

String information = "";

String telephoneDialCode = "";

Country pays = const Country(
  code: "",
  name: '',
  flag: '',
  dialCode: '',
  nameTranslations: {},
  minLength: 0,
  maxLength: 0,
);
String userIp = "";

late DeviceInfo deviceInfo;

final _registerForm = GlobalKey<FormState>();

class _RegisterState extends State<Register> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserIng();
    initContry();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNodeEmail.dispose();
    _focusNodeTelephone.dispose();
  }

  Future<void> getUserIng() async {
    final ipData = await IpCountryLookup().getIpLocationData();
    final device = await getDevicesInfo();
    userIp = ipData.ip.toString();
    deviceInfo = device;
  }

  RegisterUser getUser() {
    return RegisterUser(
      email: _textEditingController.text,
      targetUrl: 'https://korimt.com/email_verified',
      platform: deviceInfo.platform,
      deviceRef: deviceInfo.model,
      deviceRefId: deviceInfo.deviceId,
      deviceOs: deviceInfo.osName,
      ipAddress: userIp,
      country: pays.code,
      password: 'null',
    );
  }

  Future<void> initContry() async {
    final countryData = await IpCountryLookup().getIpLocationData();
    final countryFound = countries
        .where((el) =>
            el.code.toLowerCase() == countryData.country_code!.toLowerCase())
        .first;
    setState(() {
      pays = countryFound;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    /// Size confi
    SizeConfig().init(context);

    return BlocProvider(
      create: (context) => BlocProvider.of<RegisterBloc>(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: kespacing),
          child: SingleChildScrollView(
            reverse: true,
            child: BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterSessionSuccess) {
                  final user = getUser();
                  context.pushNamed(
                    CONFIRMEMAIL,
                    queryParameters: {
                      "email": _textEditingController.text,
                      "user": user.toJson(),
                    },
                  );
                }
                if (state is RegisterError) {
                  koriScaffoldMessage(
                    context,
                    "Une erreur s'est produite",
                    statut: Statut.ERROR,
                  );
                }
              },
              child: Form(
                key: _registerForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RegisterAppBar(),
                    SizedBox(height: SizeConfig.blockHorizontal! * 5),
                    Text(
                      "Votre adresse email",
                      style: koriTextStyle(
                        fontSize: SizeConfig.blockHorizontal! * 7,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockHorizontal! * 5),
                    Text(
                      "Nous vous enverrons un code de confirmation sur ce email",
                      style: koriTextStyle(
                        fontSize: SizeConfig.blockHorizontal! * 3,
                        fontWeight: FontWeight.normal,
                        fontFamily: ksecondFont,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockHorizontal! * 5),
                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        if (state is ChangeInputState) {
                          showFirstField = state.isChange;
                        }
                        if (showFirstField) {
                          information = "Utiliser mon numéro de téléphone";
                        } else {
                          information = "Utiliser mon adresse email";
                        }

                        return PageTransitionSwitcher(
                          duration: const Duration(milliseconds: 1000),
                          reverse: !showFirstField,
                          transitionBuilder: (Widget child,
                              Animation<double> primaryAnimation,
                              Animation<double> secondaryAnimation) {
                            return SharedAxisTransition(
                              animation: primaryAnimation,
                              secondaryAnimation: secondaryAnimation,
                              transitionType: SharedAxisTransitionType.vertical,
                              fillColor: kscaffoldBackgroundColor,
                              child: child,
                            );
                          },
                          child: showFirstField
                              ? InputTextFormFiled(
                                  controller: _textEditingController,
                                  focusNode: _focusNodeEmail,
                                  labelText: "Adresse Email",
                                  hintText: "Email adresse",
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (controller) {
                                    // if (controller.isNotEmpty &&
                                    //     isInt(controller)) {
                                    //   _textEditingController.text = '';
                                    //   context.read<RegisterBloc>().add(
                                    //         const ChangeInputEvent(false),
                                    //       );
                                    //   _focusNodeTelephone.requestFocus();
                                    // }
                                  },
                                )
                              : TelephoneTextFormField(
                                  controller: _textEditingController,
                                  focusNode: _focusNodeTelephone,
                                  countryCode: (dialCode) {
                                    telephoneDialCode = dialCode;
                                  },
                                  // onChanged: (controller) {
                                  //   if (controller.isEmpty ||
                                  //       (controller.length >= 3 &&
                                  //           isString(controller))) {
                                  //     context.read<RegisterBloc>().add(
                                  //           const ChangeInputEvent(true),
                                  //         );
                                  //     _textEditingController.text = '';
                                  //     _focusNodeEmail.requestFocus();
                                  //   }
                                  // },
                                ),
                        );
                      },
                    ),
                    SizedBox(height: SizeConfig.blockHorizontal! * 3),

                    // widget pour choisir sa localisation
                    PaysTextFormField(onCountryChange: (country) {
                      setState(() {
                        pays = country;
                      });
                    }),
                    SizedBox(height: SizeConfig.blockHorizontal! * 5),

                    // Social button
                    const Row(
                      children: [
                        Flexible(child: Divider()),
                        SizedBox(width: 10),
                        Text(
                          " Ou continuer avec ",
                          style: TextStyle(fontFamily: ksecondFont),
                        ),
                        SizedBox(width: 10),
                        Flexible(child: Divider()),
                      ],
                    ),
                    SizedBox(height: SizeConfig.blockHorizontal! * 5),
                    const SocialMediaIcon(),

                    // choisir un champ de connexion
                    SizedBox(height: SizeConfig.blockVertical! * 3),
                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return LinkToCreateAccount(
                          onTap: () {
                            context.read<RegisterBloc>().add(
                                  ChangeInputEvent(!showFirstField),
                                );
                          },
                          firstText: "J'ai déjà un compte ! ",
                          secondText: " $information",
                        );
                      },
                    ),
                    SizedBox(height: SizeConfig.blockVertical! * 20),

                    // button pour valider l'inscription ou la connexion
                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return PrimaryButton(
                          isLoading: state is RegisterLoadingState,
                          labelButton: "Continuer",
                          onPressed: () {
                            if (_registerForm.currentState!.validate()) {
                              final user = getUser();
                              Logger().i(user.toString());
                              context
                                  .read<RegisterBloc>()
                                  .add(RegisterCreateSessionEvent(user));
                              _registerForm.currentState!.reset();
                              // context.pushNamed(DASHBOARDPARENT);
                              // _textEditingController.clear();
                              // _focusNodeEmail.requestFocus();
                            }
                          },
                        );
                      },
                    ),
                    SizedBox(height: SizeConfig.blockVertical! * 1.5),
                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontFamily: ksecondFont,
                                  fontWeight: FontWeight.w600,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        "En continuant avec un compte basé dans le pays suivant : ",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.normal,
                                      fontFamily: ksecondFont,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " ${pays.name} ",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: kprimary,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: ksecondFont,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'tu acceptes nos  ',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: ksecondFont,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  const TextSpan(
                                    text: "Conditions d'utilisation ",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: kprimary,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: ksecondFont,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'et reconnais avoir lu notre ',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: ksecondFont,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  const TextSpan(
                                    text: " Politique de confidentialité. ",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: kprimary,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: ksecondFont,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context)
                              .viewInsets
                              .bottom // Hauteur du clavier
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
