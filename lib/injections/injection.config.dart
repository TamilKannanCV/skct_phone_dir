// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;
import 'package:skct_phone_dir/data/repositories/authentication/repo/authentication_repo.dart'
    as _i14;
import 'package:skct_phone_dir/data/repositories/authentication/repo/authentication_repo.impl.dart'
    as _i15;
import 'package:skct_phone_dir/data/repositories/authentication/service/authentication_service.dart'
    as _i11;
import 'package:skct_phone_dir/data/repositories/firebase/repo/firebase_repo.dart'
    as _i12;
import 'package:skct_phone_dir/data/repositories/firebase/repo/firebase_repo.impl.dart'
    as _i13;
import 'package:skct_phone_dir/data/repositories/firebase/service/firebase_service.dart'
    as _i6;
import 'package:skct_phone_dir/injections/modules/app_module.dart' as _i18;
import 'package:skct_phone_dir/injections/modules/firebase_module.dart' as _i19;
import 'package:skct_phone_dir/router/app_router.dart' as _i3;
import 'package:skct_phone_dir/router/guards/login_gaurd.dart' as _i9;
import 'package:skct_phone_dir/router/guards/registration_guard.dart' as _i10;
import 'package:skct_phone_dir/views/auth/auth_screen.vm.dart' as _i17;
import 'package:skct_phone_dir/views/home/home_screen.vm.dart' as _i8;
import 'package:skct_phone_dir/views/registration/registration_screen.vm.dart'
    as _i16;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    final firebaseModule = _$FirebaseModule();
    gh.lazySingleton<_i3.AppRouter>(() => appModule.appRouter);
    gh.singleton<_i4.FirebaseAuth>(firebaseModule.auth);
    gh.singleton<_i5.FirebaseFirestore>(firebaseModule.firestore);
    gh.factory<_i6.FirebaseService>(() => _i6.FirebaseService(
          gh<_i5.FirebaseFirestore>(),
          gh<_i4.FirebaseAuth>(),
        ));
    gh.singleton<_i7.GoogleSignIn>(appModule.googleSignIn);
    gh.factory<_i8.HomeScreenVm>(
        () => _i8.HomeScreenVm(gh<_i5.FirebaseFirestore>()));
    gh.singleton<_i9.LoginGaurd>(_i9.LoginGaurd(gh<_i4.FirebaseAuth>()));
    gh.singleton<_i10.RegistrationGuard>(_i10.RegistrationGuard(
      gh<_i4.FirebaseAuth>(),
      gh<_i5.FirebaseFirestore>(),
    ));
    gh.factory<_i11.AuthenticationService>(() => _i11.AuthenticationService(
          gh<_i4.FirebaseAuth>(),
          gh<_i7.GoogleSignIn>(),
        ));
    gh.factory<_i12.FirebaseRepo>(
        () => _i13.FirebaseRepoImpl(gh<_i6.FirebaseService>()));
    gh.factory<_i14.AuthenticationRepo>(
        () => _i15.AuthenticationRepoImpl(gh<_i11.AuthenticationService>()));
    gh.factory<_i16.RegistrationScreenVm>(() => _i16.RegistrationScreenVm(
          gh<_i14.AuthenticationRepo>(),
          gh<_i12.FirebaseRepo>(),
          gh<_i3.AppRouter>(),
        ));
    gh.factory<_i17.AuthScreenVm>(
        () => _i17.AuthScreenVm(gh<_i14.AuthenticationRepo>()));
    return this;
  }
}

class _$AppModule extends _i18.AppModule {}

class _$FirebaseModule extends _i19.FirebaseModule {}
