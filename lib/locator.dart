import 'package:get_it/get_it.dart';
import 'package:thorium/core/services/database_service.dart';
import 'package:thorium/core/services/local_storage_service.dart';

import 'core/services/auth_service.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerSingleton(LocalStorageService());
  locator.registerSingleton(AuthService());
  locator.registerSingleton(DatabaseService());
}
