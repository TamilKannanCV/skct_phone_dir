import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:skct_phone_dir/data/models/person.dart';
import 'package:skct_phone_dir/data/repositories/authentication/repo/authentication_repo.dart';
import 'package:skct_phone_dir/data/repositories/firebase/repo/firebase_repo.dart';
import 'package:skct_phone_dir/router/app_router.dart';
import 'package:skct_phone_dir/router/app_router.gr.dart';

@injectable
class RegistrationScreenVm extends ChangeNotifier {
  final AuthenticationRepo _authenticationRepo;
  final FirebaseRepo _firebaseRepo;
  final AppRouter _appRouter;
  RegistrationScreenVm(
    this._authenticationRepo,
    this._firebaseRepo,
    this._appRouter,
  );

  User? get currentUser => _authenticationRepo.currentUser;

  bool _registering = false;
  bool get registering => _registering;
  set registering(bool value) {
    _registering = value;
    notifyListeners();
  }

  Future<void> registerUser({
    String? registerNumber,
    required String name,
    required PersonType personType,
    required String email,
    required String mobile,
    required Branch branch,
    required Department department,
    String? parentMobile,
  }) async {
    registering = true;
    final response = await _firebaseRepo.registerUser(
      name: name,
      personType: personType,
      email: email,
      mobile: mobile,
      department: department,
      registerNumber: registerNumber,
      parentMobile: parentMobile,
    );
    registering = false;
    response.fold((r) {
      _appRouter.replace(const HomeRoute());
    }, (e) {});
  }
}
