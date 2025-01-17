import 'package:get_it/get_it.dart';
import 'package:sklad/app/auth/auth_bloc.dart';
import 'package:sklad/infrastructure/apis/apis_datasource.dart';
import 'package:sklad/infrastructure/apis/auth_datasource.dart';
import 'package:sklad/infrastructure/core/dio_settings.dart';
import 'package:sklad/infrastructure/repo/apis_repo_impl.dart';
import 'package:sklad/infrastructure/repo/auth_repo_impl.dart';

final serviceLocator = GetIt.I;

void setupLocator() {
  serviceLocator
    ..registerLazySingleton(DioSettings.new)
    ..registerLazySingleton(
      () => AuthRepoImpl(dataSourcheImpl: AuthDatasourceImpl()),
    )
    ..registerLazySingleton(
      () => ApisRepoImpl(datasourceImpl: ApisDatasourceImpl()),
    )
    ..registerSingleton(AuthBloc(serviceLocator<AuthRepoImpl>()));
}

Future resetLocator() async {
  await serviceLocator.reset();
  setupLocator();
}
