import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skct_phone_dir/firebase_options.dart';
import 'package:skct_phone_dir/injections/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:skct_phone_dir/injections/modules/app_module.dart';
import 'package:skct_phone_dir/router/app_router.dart';
import 'package:skct_phone_dir/views/auth/auth_screen.vm.dart';
import 'package:skct_phone_dir/views/home/home_screen.vm.dart';
import 'package:skct_phone_dir/views/registration/registration_screen.vm.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await configureDependencies();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => locator<AuthScreenVm>()),
        ChangeNotifierProvider(create: (context) => locator<RegistrationScreenVm>()),
        ChangeNotifierProvider(create: (context) => locator<HomeScreenVm>()),
      ],
      child: Sizer(builder: (context, _, __) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            colorSchemeSeed: Colors.orange,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorSchemeSeed: Colors.orange,
          ),
          routerConfig: locator<AppRouter>().config(),
        );
      }),
    );
  }
}
