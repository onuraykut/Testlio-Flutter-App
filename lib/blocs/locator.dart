
import 'package:eslesmeapp/data/bildirim_repository.dart';
import 'package:eslesmeapp/data/cozdugumTestler_repository.dart';
import 'package:eslesmeapp/data/sonuc_repository.dart';
import 'package:eslesmeapp/data/test_repository.dart';
import 'package:eslesmeapp/data/user_repository.dart';
import 'package:eslesmeapp/tools/PushNotificationService.dart';
import 'package:eslesmeapp/tools/class.dart';
import 'package:eslesmeapp/tools/navigationService.dart';
import 'package:get_it/get_it.dart';


final GetIt locator= GetIt.instance;

void setupLocator(){

  locator.registerLazySingleton(() => TestRepository());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => CozdugumRepository());
  locator.registerLazySingleton(() => SonucRepository());
  locator.registerLazySingleton(() => BildirimRepository());
  locator.registerLazySingleton(() => PushNotificationService());
  locator.registerLazySingleton(() => NavigationService());

  ClassBuilder.registerClasses();
}
