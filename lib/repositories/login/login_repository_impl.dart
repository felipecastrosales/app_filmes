import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  // ignore: override_on_non_overriding_member
  Future<UserCredential> login() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    if (googleAuth != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return FirebaseAuth.instance.signInWithCredential(credential);
    }
    throw Exception('Erro ao realizar login com Google');
  }
}
