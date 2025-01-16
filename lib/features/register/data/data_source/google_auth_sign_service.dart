import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthSignService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<User?> getCurrentUser() async {
    return firebaseAuth.currentUser;
  }

  Future<Either<String, User?>> signWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken,
      );

      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      User? googleUser = userCredential.user;
      if (googleUser != null) {
        return Right(googleUser);
      }
      return const Left("Utilisateur non trouvé...");
    } on Exception catch (e) {
      return Left("Une erreur s'est produite ${e.toString()}");
    }
  }
}
