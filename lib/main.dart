import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kori_etu/config/theme/dark_theme.dart';
import 'package:kori_etu/config/theme/light_theme.dart';
import 'package:kori_etu/controller/transaction_controller.dart';
import 'package:kori_etu/features/introduction/presentation/bloc/onboarding_bloc.dart';
import 'package:kori_etu/features/login/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:kori_etu/features/register/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:kori_etu/features/register/presentation/bloc/update_profil_bloc/update_profil_bloc.dart';
import 'package:kori_etu/injection_dependance.dart';
import 'config/routes/route.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  // Ensure the Flutter framework is initialized before using any platform-specific code.
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // // Initialize GetStorage
  await GetStorage.init();

  // Initialize dependances
  initializeDependances();

  // Initialize Firebase
  // await Firebase.initializeApp();

  // Initialisez l'observateur personnalisé
  // Bloc.observer = MyBlocObserver();

  Get.lazyPut(() => TransactionController());

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    initialisation();
  }

  void initialisation() {
    Future.delayed(const Duration(seconds: 0), () {
      FlutterNativeSplash.remove();
    });
  }

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

    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingBloc>(create: (context) => OnboardingBloc()),
        BlocProvider<RegisterBloc>(create: (context) => getIt<RegisterBloc>()),
        BlocProvider<AuthBloc>(create: (context) => getIt<AuthBloc>()),
        BlocProvider<UpdateProfilBloc>(
          create: (context) => getIt<UpdateProfilBloc>(),
        ),
        // BlocProvider<EmailVerifiedBloc>(
        //     create: (context) => koriSl<EmailVerifiedBloc>()),
      ],
      child: GetMaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Kori Etu',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
        // routerConfig: router,
      ),
    );
  }
}
