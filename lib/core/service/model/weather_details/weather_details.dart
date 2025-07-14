import 'package:json_annotation/json_annotation.dart';

part 'weather_details.g.dart';

@JsonSerializable()
class WeatherDetails {
  final Location? location;
  final Current? current;
  final Forecast? forecast;

  WeatherDetails({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherDetails.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDetailsToJson(this);
}

@JsonSerializable()
class Current {
  @JsonKey(name: 'last_updated_epoch')
  final int? lastUpdatedEpoch;

  @JsonKey(name: 'last_updated')
  final String? lastUpdated;

  @JsonKey(name: 'temp_c')
  final double? tempC;

  @JsonKey(name: 'temp_f')
  final double? tempF;

  @JsonKey(name: 'is_day')
  final int? isDay;
  final Condition? condition;

  @JsonKey(name: 'wind_mph')
  final double? windMph;

  @JsonKey(name: 'wind_kph')
  final double? windKph;

  @JsonKey(name: 'wind_degree')
  final int? windDegree;

  @JsonKey(name: 'wind_dir')
  final String? windDir;

  @JsonKey(name: 'pressure_mb')
  final int? pressureMb;

  @JsonKey(name: 'pressure_in')
  final double? pressureIn;

  @JsonKey(name: 'precip_mm')
  final double? precipMm;

  @JsonKey(name: 'precip_in')
  final int? precipIn;
  final int? humidity;
  final int? cloud;

  @JsonKey(name: 'feelslike_c')
  final double? feelslikeC;

  @JsonKey(name: 'feelslike_f')
  final double? feelslikeF;

  @JsonKey(name: 'windchill_c')
  final double? windchillC;

  @JsonKey(name: 'windchill_f')
  final double? windchillF;

  @JsonKey(name: 'heatindex_c')
  final double? heatindexC;

  @JsonKey(name: 'heatindex_f')
  final double? heatindexF;

  @JsonKey(name: 'dewpoint_c')
  final double? dewpointC;

  @JsonKey(name: 'dewpoint_f')
  final double? dewpointF;

  @JsonKey(name: 'vis_km')
  final int? visKm;

  @JsonKey(name: 'vis_miles')
  final int? visMiles;
  final double? uv;

  @JsonKey(name: 'gust_mph')
  final double? gustMph;

  @JsonKey(name: 'gust_kph')
  final double? gustKph;

  @JsonKey(name: 'time_epoch')
  final int? timeEpoch;
  final String? time;

  @JsonKey(name: 'snow_cm')
  final int? snowCm;

  @JsonKey(name: 'will_it_rain')
  final int? willItRain;

  @JsonKey(name: 'chance_of_rain')
  final int? chanceOfRain;

  @JsonKey(name: 'will_it_snow')
  final int? willItSnow;

  @JsonKey(name: 'chance_of_snow')
  final int? chanceOfSnow;

  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
    required this.timeEpoch,
    required this.time,
    required this.snowCm,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
  });

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

@JsonSerializable()
class Condition {
  final String? text;
  final String? icon;
  final int? code;

  Condition({required this.text, required this.icon, required this.code});

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

@JsonSerializable()
class Forecast {
  @JsonKey(name: 'forecastday')
  final List<ForecastDay>? forecastDay;

  Forecast({required this.forecastDay});

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

@JsonSerializable()
class ForecastDay {
  final DateTime? date;

  @JsonKey(name: 'date_epoch')
  final int? dateEpoch;
  final Day? day;
  final Astro? astro;
  final List<Current>? hour;

  ForecastDay({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastDayToJson(this);
}

@JsonSerializable()
class Astro {
  final String? sunrise;
  final String? sunset;
  final String? moonrise;
  final String? moonset;

  @JsonKey(name: 'moon_phase')
  final String? moonPhase;

  @JsonKey(name: 'moon_illumination')
  final int? moonIllumination;

  @JsonKey(name: 'is_moon_up')
  final int? isMoonUp;

  @JsonKey(name: 'is_sun_up')
  final int? isSunUp;

  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) => _$AstroFromJson(json);

  Map<String, dynamic> toJson() => _$AstroToJson(this);
}

@JsonSerializable()
class Day {
  @JsonKey(name: 'maxtemp_c')
  final double? maxtempC;

  @JsonKey(name: 'maxtemp_f')
  final double? maxtempF;

  @JsonKey(name: 'mintemp_c')
  final double? mintempC;

  @JsonKey(name: 'mintemp_f')
  final double? mintempF;

  @JsonKey(name: 'avgtemp_c')
  final int? avgtempC;

  @JsonKey(name: 'avgtemp_f')
  final double? avgtempF;

  @JsonKey(name: 'maxwind_mph')
  final double? maxwindMph;

  @JsonKey(name: 'maxwind_kph')
  final double? maxwindKph;

  @JsonKey(name: 'totalprecip_mm')
  final double? totalprecipMm;

  @JsonKey(name: 'totalprecip_in')
  final int? totalprecipIn;

  @JsonKey(name: 'totalsnow_cm')
  final int? totalsnowCm;

  @JsonKey(name: 'avgvis_km')
  final int? avgvisKm;

  @JsonKey(name: 'avgvis_miles')
  final int? avgvisMiles;
  final int? avghumidity;

  @JsonKey(name: 'daily_will_it_rain')
  final int? dailyWillItRain;

  @JsonKey(name: 'daily_chance_of_rain')
  final int? dailyChanceOfRain;

  @JsonKey(name: 'daily_will_it_snow')
  final int? dailyWillItSnow;

  @JsonKey(name: 'daily_chance_of_snow')
  final int? dailyChanceOfSnow;
  final Condition? condition;
  final double? uv;

  Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);
}

@JsonSerializable()
class Location {
  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;

  @JsonKey(name: 'tz_id')
  final String? tzId;

  @JsonKey(name: 'localtime_epoch')
  final int? localtimeEpoch;
  final String? localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
