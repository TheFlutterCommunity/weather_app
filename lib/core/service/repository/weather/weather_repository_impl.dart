import 'package:dio/dio.dart';

import '../../../../index.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  late final WeatherAPIService _weatherAPIService = WeatherAPIService(
    Dio(),
    baseUrl: ServiceConstants.weatherAPIBaseUrl,
  );

  @override
  Future<WeatherDetails> getWeatherDetails({
    required String apiKey,
    required String latLng,
  }) => _weatherAPIService.getDashboardDetails(apiKey: apiKey, latLng: latLng);
}
