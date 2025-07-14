part of 'weather_forecast_bloc.dart';

abstract class WeatherForecastEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherForecastInitialEvent extends WeatherForecastEvent {
  WeatherForecastInitialEvent();
}

class FetchConnectivityEvent extends WeatherForecastEvent {
  FetchConnectivityEvent();
}

class FetchLocationEvent extends WeatherForecastEvent {
  FetchLocationEvent();
}

class FetchWeatherEvent extends WeatherForecastEvent {
  final String apiKey;
  final String latLng;

  FetchWeatherEvent({required this.apiKey, required this.latLng});
}

class FetchWeatherFromDBEvent extends WeatherForecastEvent {
  final int userId;

  FetchWeatherFromDBEvent({required this.userId});
}
