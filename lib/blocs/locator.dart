
import 'package:eslesmeapp/data/test_repository.dart';
import 'package:eslesmeapp/data/user_repository.dart';
import 'package:eslesmeapp/tools/class.dart';
import 'package:get_it/get_it.dart';


final GetIt locator= GetIt.instance;

void setupLocator(){

  locator.registerLazySingleton(() => TestRepository());
  locator.registerLazySingleton(() => UserRepository());
  ClassBuilder.registerClasses();
}
