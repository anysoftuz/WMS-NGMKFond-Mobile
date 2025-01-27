import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sklad/app/auth/auth_bloc.dart';
import 'package:sklad/app/home/home_bloc.dart';
import 'package:sklad/assets/constants/storage_keys.dart';
import 'package:sklad/assets/themes/theme.dart';
import 'package:sklad/assets/themes/theme_changer.dart';
import 'package:sklad/infrastructure/core/service_locator.dart';
import 'package:sklad/infrastructure/repo/apis_repo_impl.dart';
import 'package:sklad/infrastructure/repo/auth_repo_impl.dart';
import 'package:sklad/infrastructure/repo/storage_repository.dart';
import 'package:sklad/src/settings/local_provider.dart';
import 'package:sklad/l10n/localizations.dart';
import 'package:sklad/presentation/routers/app_routes.dart';
import 'package:sklad/presentation/routers/route_name.dart';
import 'package:sklad/utils/bloc_logger.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:sklad/utils/device_info.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await StorageRepository.getInstance();
  await StorageRepository.putString(StorageKeys.deviceId, await getDeviceId());
  await StorageRepository.putString(
    StorageKeys.deviceModel,
    await getDeviceModel(),
  );
  setupLocator();
  if (kDebugMode) {
    Bloc.observer = LogBlocObserver();
  }
  runApp(const DependencyScope(
    initialModel: AppScope(themeMode: ThemeMode.light),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthBloc(serviceLocator<AuthRepoImpl>())..add(CheckUserEvent()),
        ),
        BlocProvider(
          create: (context) => HomeBloc(serviceLocator<ApisRepoImpl>()),
        ),
      ],
      child: ChangeNotifierProvider<LocaleProvider>(
        create: (_) => LocaleProvider(),
        builder: (context, child) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Provider.of<LocaleProvider>(context).locale,
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouts.router,
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            themeMode: AppScope.of(context).themeMode,
            builder: (context, child) => BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                debugPrint(
                    'STATE LISTENER ============> //${state.statusAuth}');
                switch (state.statusAuth) {
                  case AuthenticationStatus.unauthenticated:
                    AppRouts.router.pushReplacement(AppRouteName.auth);
                    break;
                  case AuthenticationStatus.authenticated:
                    AppRouts.router.go(AppRouteName.home);
                    break;
                  case AuthenticationStatus.loading:
                  case AuthenticationStatus.cancelLoading:
                    break;
                }
              },
              child: KeyboardDismisser(child: child),
            ),
          );
        },
      ),
    );
  }
}
