import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerSingleton(ApiServices());
  locator.registerSingleton(AuthDataService());

//instantiating DatabaseServices as a lazySingleTone for dependencyInjection
  locator.registerLazySingleton<DatabaseService>(() => DatabaseService());
//
//  locator.registerFactory(() => ChatModel());
//  locator.registerFactory(() => ConversationModel());

//  locator.registerFactory(() => HomeModel());
//  locator.registerFactory(() => PrescriptionMainModel());
}
