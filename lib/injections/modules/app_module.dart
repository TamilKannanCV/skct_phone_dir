import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:skct_phone_dir/router/app_router.dart';

typedef ScaffoldMessengerStateKey = GlobalKey<ScaffoldMessengerState>;

@module
abstract class AppModule {
  @lazySingleton
  AppRouter get appRouter => AppRouter();

  @singleton
  GoogleSignIn get googleSignIn => GoogleSignIn.standard();
}
