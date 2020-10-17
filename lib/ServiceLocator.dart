import 'package:get_it/get_it.dart';
import 'package:petro/services/AuthenticationService.dart';
import 'package:petro/services/DatabaseService.dart';
import 'package:petro/services/NavigationService.dart';

GetIt locator = GetIt.instance;

void setuplocator(){
  locator.registerLazySingleton(() => DatabaseService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => NavigationService());
}