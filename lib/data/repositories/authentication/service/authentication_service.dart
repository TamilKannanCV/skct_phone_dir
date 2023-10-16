import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthenticationService {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthenticationService(this._auth, this._googleSignIn);

  User? get currentUser => _auth.currentUser;

  bool get isAuthenticated => _auth.currentUser != null;

  Future<User> signInWithGoogle({bool silentely = false}) async {
    GoogleSignInAccount? ggleAcc;
    if (silentely) {
      ggleAcc = await _googleSignIn.signInSilently();
      if (ggleAcc == null)
        throw Exception("Not a previously authenticated user");
    }
    ggleAcc ??= await _googleSignIn.signIn();
    final authCred = await ggleAcc?.authentication;
    final cred = await _auth.signInWithCredential(GoogleAuthProvider.credential(
      accessToken: authCred?.accessToken,
      idToken: authCred?.idToken,
    ));
    final user = cred.user;
    if (user == null) throw Exception();
    return user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
