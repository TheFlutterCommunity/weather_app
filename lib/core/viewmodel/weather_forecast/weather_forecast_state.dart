part of 'weather_forecast_bloc.dart';

abstract class WeatherForecastState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherForecastInitialState extends WeatherForecastState {
  WeatherForecastInitialState();
}

class ConnectionResultState extends WeatherForecastState {
  final bool isConnected;

  ConnectionResultState({required this.isConnected});
}

class LocationResultState extends WeatherForecastState {
  final String latLng;

  LocationResultState({required this.latLng});
}

class WeatherForecastLoadingState extends WeatherForecastState {
  WeatherForecastLoadingState();
}

class WeatherForecastSuccessState extends WeatherForecastState {
  final WeatherDetails weatherDetails;

  WeatherForecastSuccessState({required this.weatherDetails});
}

class WeatherForecastErrorState extends WeatherForecastState {
  final String error;

  WeatherForecastErrorState({required this.error});
}
