import 'package:auto_route/auto_route.dart';
import 'package:skct_phone_dir/injections/injection.dart';
import 'package:skct_phone_dir/router/guards/login_gaurd.dart';
import 'package:skct_phone_dir/router/guards/registration_guard.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page),
        AutoRoute(
          page: HomeRoute.page,
          guards: [
            locator<LoginGaurd>(),
            locator<RegistrationGuard>(),
          ],
          initial: true,
        ),
        AutoRoute(page: RegistrationRoute.page),
      ];
}
