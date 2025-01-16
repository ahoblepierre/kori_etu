import 'package:go_router/go_router.dart';
import 'package:kori_etu/config/routes/route_name.dart';
import 'package:kori_etu/core/services/storage_service.dart';
import 'package:kori_etu/features/dashboard_etuddiant/presentation/pages/dashboard_etudiant_page.dart';
import 'package:kori_etu/features/dashboard_parent/presentation/pages/dashboard_page.dart';
import 'package:kori_etu/features/envoyer_argent_parent/presentation/pages/envoyer_argent_page.dart';
import 'package:kori_etu/features/envoyer_argent_parent/presentation/pages/old/envoyer_par_carte.dart';
import 'package:kori_etu/features/envoyer_argent_parent/presentation/pages/old/message_resumer_transfert_page.dart';
import 'package:kori_etu/features/envoyer_argent_parent/presentation/pages/resume_transfert.dart';
import 'package:kori_etu/features/introduction/presentation/pages/get_started_page.dart';
import 'package:kori_etu/features/introduction/presentation/pages/onboarding.dart';
import 'package:kori_etu/features/introduction/presentation/pages/onboarding_end.dart';
import 'package:kori_etu/features/login/presentation/pages/authenticated_page.dart';
import 'package:kori_etu/features/register/presentation/pages/email_confirme.dart';
import 'package:kori_etu/features/register/presentation/pages/email_verified.dart';
import 'package:kori_etu/features/login/presentation/pages/login_page.dart';
import 'package:kori_etu/features/login/presentation/pages/set_pin_code.dart';
import 'package:kori_etu/features/login/presentation/pages/sign_up_page.dart';
import 'package:kori_etu/features/register/presentation/pages/biometric_page.dart';
import 'package:kori_etu/features/register/presentation/pages/register.dart';
import 'package:kori_etu/features/register/presentation/pages/register_first.dart';
import 'package:kori_etu/features/register/presentation/pages/register_second.dart';
import 'package:kori_etu/features/register/presentation/pages/welcome_etudiant_page.dart';
import 'package:kori_etu/features/register/presentation/pages/welcome_parent_page.dart';
import 'package:kori_etu/features/verification/presentation/pages/identification_seconde_page.dart';
import 'package:kori_etu/features/verification/presentation/pages/identificaton_page.dart';

/// getstorage
final storage = StorageService();

final router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: MAIN,
      builder: (context, state) => Onboarding(),
      redirect: (context, state) {
        /// verifie se le onboarding a été déja vu
        if (storage.hasCompletedOnboarding) {
          return "/register";
        }
        return null;
      },
      routes: <RouteBase>[
        /// First Route
        GoRoute(
          path: ONBOARDING,
          builder: (context, state) => Onboarding(),
          routes: <RouteBase>[
            GoRoute(
              path: "onboarding_end",
              name: ONBOARDINGEND,
              builder: (context, state) => const OnboardingEnd(),
              routes: const <RouteBase>[],
            ),
            GoRoute(
              path: "getstarted",
              name: GETSTARTED,
              builder: (context, state) => const GetStartedPage(),
              routes: const <RouteBase>[],
            ),
          ],
        ),
      ],
    ),

    /// Auth route
    GoRoute(
      path: "/login",
      name: LOGIN,
      builder: (context, state) => LoginPage(),
      routes: const <RouteBase>[],
    ),

    GoRoute(
      path: "/authenticated",
      name: AUTHENTICATED,
      builder: (context, state) => AuthenticatedPage(),
      routes: const <RouteBase>[],
    ),

    /// Biometric route
    GoRoute(
      path: "/biometric",
      name: BIOMETRIC,
      builder: (context, state) => const BiometricPage(),
      routes: const <RouteBase>[],
    ),
    GoRoute(
      path: "/welcome_etudiant",
      name: WELCOMETUDIANT,
      builder: (context, state) => const WelcomeEtudiantPage(),
      routes: const <RouteBase>[],
    ),
    GoRoute(
      path: "/welcome_parent",
      name: WELCOMEPARENT,
      builder: (context, state) => const WelcomeParentPage(),
      routes: const <RouteBase>[],
    ),
    GoRoute(
      path: "/singup_first",
      name: SINGUPFIRST,
      builder: (context, state) => RegisterFirst(),
      routes: const <RouteBase>[],
    ),

    /// Register route etape
    GoRoute(
      path: "/register",
      name: REGISTER,
      builder: (context, state) => const Register(),
      redirect: (context, state) {
        /// verifie s'il s'est deja connecte
        if (storage.isAuthenticated) {
          return "/dashboard";
        }
        return null;
      },
      routes: <RouteBase>[
        GoRoute(
          path: "singup_secon",
          name: SINGUPSECOND,
          builder: (context, state) => RegisterSecond(),
          routes: const <RouteBase>[],
        ),
        GoRoute(
          path: "singup",
          name: SINGUP,
          builder: (context, state) => const SignUpPage(),
          routes: const <RouteBase>[],
        ),
        GoRoute(
          path: 'confirme_email',
          name: CONFIRMEMAIL,
          builder: (context, state) => const EmailConfirme(),
        ),
        GoRoute(
          path: "email_verified/:token",
          name: EMAILVERIFIED,
          builder: (context, state) {
            final String token = state.pathParameters['token'] ?? "";
            return EmailVerified(token: token);
          },
        ),
        GoRoute(
          path: "setpincode",
          name: SETPINCODE,
          builder: (context, state) => SetPinCode(),
          routes: const <RouteBase>[],
        ),
      ],
    ),

    /// Dashboard Parent
    GoRoute(
      path: "/dashboard_etudiant",
      name: DASHBOARDETUDIANT,
      builder: (context, state) => const DashboardEtudiantPage(),
      routes: const <RouteBase>[],
    ),

    ///================================================================
    ///  Dashboard
    GoRoute(
      path: "/dashboard",
      name: DASHBOARD,
      builder: (context, state) => const DashboardPage(),
      redirect: (context, state) {
        if (storage.isDateOlderThan5Minutes) {
          return "/authenticated";
        }
        return null;
      },
      routes: <RouteBase>[
        GoRoute(
          path: "envoyer_argent",
          name: ENVOYERARGENT,
          builder: (context, state) => EnvoyerArgentPage(),
          routes: const <RouteBase>[],
        ),
        GoRoute(
          path: "envoyer_argent_parent_par_carte",
          name: ENVOYERARGENTPARENTPARCARTE,
          builder: (context, state) => const EnvoyerParCarte(),
          routes: const <RouteBase>[],
        ),
        GoRoute(
          path: "resumer_transfert",
          name: RESUMERTRANSFERT,
          builder: (context, state) => ResumeTransfert(),
          routes: const <RouteBase>[],
        ),
        GoRoute(
          path: "message_resumer_transfert",
          name: MESSAGERESUMERTRANSFERT,
          builder: (context, state) => const MessageResumerTransfertPage(),
          routes: const <RouteBase>[],
        ),
        GoRoute(
          path: "identification",
          name: IDENTIFICATION,
          builder: (context, state) => IdentificatonPage(),
          routes: const <RouteBase>[],
        ),
        GoRoute(
          path: "identification_seconde",
          name: IDENTIFICATIONSECONDE,
          builder: (context, state) => const IdentificationSecondePage(),
          routes: const <RouteBase>[],
        )
      ],
    ),
  ],
);
