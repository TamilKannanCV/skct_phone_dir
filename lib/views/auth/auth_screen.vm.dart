import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:skct_phone_dir/data/repositories/authentication/repo/authentication_repo.dart';

@injectable
class AuthScreenVm extends ChangeNotifier {
  final AuthenticationRepo _authenticationRepo;
  AuthScreenVm(this._authenticationRepo);

  bool _isAuthenticating = false;
  bool get isAuthenticating => _isAuthenticating;
  set isAuthenticating(bool value) {
    _isAuthenticating = value;
    notifyListeners();
  }

  Future<void> signInSilentlyWithGoogle({
    void Function(bool success)? onResult,
  }) async {
    _isAuthenticating = true;
    final response = await _authenticationRepo.signInWithGoogle(silently: true);
    isAuthenticating = false;
    response.fold(
      (r) => onResult?.call(true),
      (e) => onResult?.call(false),
    );
  }

  Future<void> signInWithGoogle({
    void Function(bool success)? onResult,
  }) async {
    isAuthenticating = true;
    final response = await _authenticationRepo.signInWithGoogle();
    isAuthenticating = false;
    response.fold(
      (r) => onResult?.call(true),
      (e) => onResult?.call(false),
    );
  }
}
