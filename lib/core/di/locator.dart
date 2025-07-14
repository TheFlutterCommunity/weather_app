import 'package:get_it/get_it.dart';

import '../../index.dart';

final locator = GetIt.I;

void setupLocator() {
  /// Repository
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(),
  );

  /// Preferences
  locator.registerLazySingleton(() => PrefsHelper());

  /// Local Database
  locator.registerLazySingleton<DBHelper>(() => DbHelperImpl());

  /// Bloc
  locator.registerFactory<AuthBloc>(() => AuthBloc());
  locator.registerFactory<WeatherForecastBloc>(() => WeatherForecastBloc());
}
