import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:health_app/network/my_repo.dart';
import 'package:health_app/network/web_services.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt<WebServices>()));
  getIt.registerSingleton<WebServices>(WebServices(Dio()));
}
