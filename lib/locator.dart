import 'package:get_it/get_it.dart';

import 'core/services/api_services.dart';
import 'core/services/auth_service.dart';
import 'core/services/database_service.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerSingleton(ApiServices());

  locator.registerLazySingleton<DatabaseService>(() => DatabaseService());
  locator.registerSingleton(AuthService());
}
