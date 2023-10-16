import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthenticationRepo {
  ///Sign-In with Google.
  ///Returns [User] on success.
  ///Throws error if unsuccessful.
  Future<Either<User, dynamic>> signInWithGoogle({bool silently = false});

  ///Sign-Out from the Current user.
  Future<void> signOut();

  ///Returns the [User], currently signed in.
  User? get currentUser;

  ///Returns [bool], whether the user is signed in.
  bool get isAuthenticated;
}
