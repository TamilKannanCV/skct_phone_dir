import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:skct_phone_dir/router/app_router.gr.dart';

@singleton
class RegistrationGuard extends AutoRouteGuard {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  RegistrationGuard(this._auth, this._firestore);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final snapshot = await _firestore.collection("contacts").doc(_auth.currentUser?.uid).get();
    final data = snapshot.data();
    if (data == null) {
      router.replace(const RegistrationRoute());
    } else {
      resolver.next();
    }
  }
}
