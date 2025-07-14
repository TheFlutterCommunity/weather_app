import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/index.dart';

import '../../main.dart';

final router = GoRouter(
  navigatorKey: navigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: kHome,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider.value(
          value: locator<AuthBloc>()..add(CheckSignedInEvent()),
          child: SignInView(key: UniqueKey()),
        );
      },
    ),
    GoRoute(
      path: kWeatherForecast,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider.value(
          value: locator<WeatherForecastBloc>()
            ..add(WeatherForecastInitialEvent()),
          child: WeatherForecastView(key: UniqueKey()),
        );
      },
    ),
  ],
);
