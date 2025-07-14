import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../index.dart';

part 'weather_api_service.g.dart';

@RestApi(baseUrl: ServiceConstants.weatherAPIBaseUrl)
abstract class WeatherAPIService {
  factory WeatherAPIService(Dio dio, {String baseUrl}) = _WeatherAPIService;

  @GET(ServiceConstants.getWeatherDetailsPath)
  Future<WeatherDetails> getDashboardDetails({
    @Query('key') required String apiKey,
    @Query('q') required String latLng,
  });
}
