import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:skct_phone_dir/router/app_router.gr.dart';

@singleton
class LoginGaurd extends AutoRouteGuard {
  final FirebaseAuth _auth;
  LoginGaurd(this._auth);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (_auth.currentUser != null) {
      resolver.next();
    } else {
      resolver
          .redirect(AuthRoute(onResult: (success) => resolver.next(success)));
    }
  }
}
