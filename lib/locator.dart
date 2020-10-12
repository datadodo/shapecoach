import 'package:shapecoach/services/authentication_service.dart';
import 'package:shapecoach/services/cloud_storage_service.dart';
import 'package:shapecoach/services/firestore_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shapecoach/services/navigation_service.dart';
import 'package:shapecoach/services/dialog_service.dart';
import 'package:shapecoach/utils/image_selector.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => CloudStorageService());
  locator.registerLazySingleton(() => ImageSelector());
}