import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../index.dart';

part 'weather_forecast_event.dart';
part 'weather_forecast_state.dart';

class WeatherForecastBloc
    extends Bloc<WeatherForecastEvent, WeatherForecastState> {
  WeatherForecastBloc() : super(WeatherForecastInitialState()) {
    on<WeatherForecastInitialEvent>((event, emit) => _onInitial(event, emit));
    on<FetchWeatherEvent>((event, emit) => _onFetchWeather(event, emit));
    on<FetchWeatherFromDBEvent>(
      (event, emit) => _onFetchWeatherFromDB(event, emit),
    );
  }

  void _onInitial(
    WeatherForecastInitialEvent event,
    Emitter<WeatherForecastState> emit,
  ) {
    //TODO: Not implemented
  }

  void _onFetchWeather(
    FetchWeatherEvent event,
    Emitter<WeatherForecastState> emit,
  ) async {
    try {
      /// Emit the loading state
      emit(WeatherForecastLoadingState());

      /// Fetch the weather details
      final weatherDetails = await locator<WeatherRepository>()
          .getWeatherDetails(apiKey: event.apiKey, latLng: event.latLng);

      /// Clear the previous weather details from DB
      await locator<DBHelper>().clearWeatherTable();

      /// Save the weather details to DB
      await locator<DBHelper>().saveWeatherDetails(
        userId: await locator<PrefsHelper>().getUserId(),
        weatherDetails: weatherDetails,
      );

      /// Emit the success state
      emit(WeatherForecastSuccessState(weatherDetails: weatherDetails));
    } catch (e) {
      /// Emit the error state
      emit(WeatherForecastErrorState(error: kFetchFailed));
    }
  }

  void _onFetchWeatherFromDB(
    FetchWeatherFromDBEvent event,
    Emitter<WeatherForecastState> emit,
  ) async {
    try {
      /// Emit the loading state
      emit(WeatherForecastLoadingState());

      /// Fetch the weather details
      final weatherDetails = await locator<DBHelper>().getWeatherDetails(
        userId: event.userId,
      );

      if (weatherDetails == null) {
        /// Emit the error state
        emit(WeatherForecastErrorState(error: kFetchFailed));
        return;
      }

      /// Emit the success state
      emit(WeatherForecastSuccessState(weatherDetails: weatherDetails));
    } catch (e) {
      /// Emit the error state
      emit(WeatherForecastErrorState(error: kFetchFailed));
    }
  }
}
