import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// Service d'authentification avec Apple
class AppleAuthSignService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  /// Connecter un utilisateur apple
  Future<Either<String, UserCredential>> signWithAppleOneMethode() async {
    try {
      final AppleAuthProvider appleProvider = AppleAuthProvider();
      final user = await firebaseAuth.signInWithProvider(appleProvider);
      return Right(user);
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }

  /// Connecter un utilisateur apple avec un code d'autorisation
  Future<Either<String, dynamic>> signWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      return Right(credential);
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}
