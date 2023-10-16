import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:skct_phone_dir/injections/injection.config.dart';

final locator = GetIt.I;

@InjectableInit()
Future<void> configureDependencies() async => locator.init();
