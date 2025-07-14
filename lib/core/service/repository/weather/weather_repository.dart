import '../../../../index.dart';

abstract class WeatherRepository {
  Future<WeatherDetails> getWeatherDetails({
    required String apiKey,
    required String latLng,
  });
}
