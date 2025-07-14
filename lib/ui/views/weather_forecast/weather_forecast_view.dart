import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart' hide ErrorWidget;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../index.dart';

class WeatherForecastView extends StatefulWidget {
  const WeatherForecastView({super.key});

  @override
  State<WeatherForecastView> createState() => _WeatherForecastViewState();
}

class _WeatherForecastViewState extends State<WeatherForecastView> {
  late final StreamSubscription<List<ConnectivityResult>>
  _connectivitySubscription;

  @override
  void initState() {
    super.initState();

    /// Listen to connectivity
    _listenToConnectivity();

    /// For the initial execution
    //TODO: This can also be handled through bloc
    Utils.hasConnectivity().then((value) {
      if (value) {
        /// Fetch weather details
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _fetchWeatherDetails();
        });
      } else {
        /// Fetch weather details from DB
        _fetchWeatherDetailsFromDB();
      }
    });
  }

  /// Listen to connectivity
  void _listenToConnectivity() {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      debugPrint('Connectivity Changed: $results');

      if (results.contains(ConnectivityResult.wifi) ||
          results.contains(ConnectivityResult.mobile) ||
          results.contains(ConnectivityResult.ethernet)) {
        /// Show Offline Toast
        Utils.showToast(kOnline);

        /// Fetch weather details
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _fetchWeatherDetails();
        });
      } else if (results.contains(ConnectivityResult.none)) {
        /// Show Offline Toast
        Utils.showToast(kOffline);

        /// Fetch weather details from DB
        _fetchWeatherDetailsFromDB();
      }
    });
  }

  /// Fetch weather details
  Future<void> _fetchWeatherDetails() async {
    /// Get location
    //TODO: Location fetch can also be handled through bloc
    /// and then we can invoke fetch weather details event
    final location = await LocationUtils.getCurrentLocation();

    final latLng = '${location.latitude},${location.longitude}';

    if (!mounted) return;

    /// Fetch weather details event
    context.read<WeatherForecastBloc>().add(
      FetchWeatherEvent(apiKey: ServiceConstants.weatherAPIKey, latLng: latLng),
    );
  }

  /// Fetch weather details from DB
  Future<void> _fetchWeatherDetailsFromDB() async {
    if (!mounted) return;

    /// Fetch weather details event
    context.read<WeatherForecastBloc>().add(
      FetchWeatherFromDBEvent(userId: await locator<PrefsHelper>().getUserId()),
    );
  }

  @override
  void dispose() {
    /// Cancel the connectivity subscription
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<WeatherForecastBloc, WeatherForecastState>(
          listener: (BuildContext context, state) {
            //TODO: Not implemented
          },
          builder: (BuildContext context, state) {
            if (state is WeatherForecastLoadingState) {
              return const CustomCircularIndicator();
            } else if (state is WeatherForecastSuccessState) {
              return _buildWeatherForecastView(
                weatherDetails: state.weatherDetails,
              );
            } else if (state is WeatherForecastErrorState) {
              return ErrorWidget(error: state.error);
            }
            return const Empty();
          },
        ),
      ),
    );
  }

  Widget _buildWeatherForecastView({required WeatherDetails weatherDetails}) {
    return Padding(
      padding: EdgeInsets.all(s3),
      child: Column(
        children: [
          WeatherHeaderWidget(
            location: weatherDetails.location,
            current: weatherDetails.current,
          ),
          WeatherForeCastListWidget(
            hourly: weatherDetails.forecast?.forecastDay?.first.hour ?? [],
          ),
        ],
      ),
    );
  }
}
