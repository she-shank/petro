import 'package:get_it/get_it.dart';
import 'package:petro/services/AuthenticationService.dart';
import 'package:petro/services/DatabaseService.dart';

GetIt locator = GetIt.instance;

void setuplocator(){
  locator.registerLazySingleton(() => DatabaseService());
  locator.registerLazySingleton(() => AuthenticationService());
}