import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:skct_phone_dir/data/repositories/authentication/service/authentication_service.dart';
import 'package:skct_phone_dir/global/logger.dart';

import 'authentication_repo.dart';

@Injectable(as: AuthenticationRepo)
class AuthenticationRepoImpl implements AuthenticationRepo {
  final AuthenticationService _service;
  AuthenticationRepoImpl(this._service);

  @override
  User? get currentUser => _service.currentUser;

  @override
  bool get isAuthenticated => _service.isAuthenticated;

  @override
  Future<Either<User, dynamic>> signInWithGoogle({bool silently = false}) async {
    try {
      final response = await _service.signInWithGoogle(silentely: silently);
      return Left(response);
    } catch (e) {
      logger.e(e);
      return Right(e);
    }
  }

  @override
  Future<void> signOut() async {
    await _service.signOut();
  }
}
