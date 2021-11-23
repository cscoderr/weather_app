import 'package:json_annotation/json_annotation.dart';
import 'package:weather_api/weather_api.dart';

part 'daily_forecast.g.dart';

@JsonSerializable()
class DailyForecast {
  DailyForecast({
    this.dt,
    this.temp,
    this.weather,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) =>
      _$DailyForecastFromJson(json);

  final int? dt;
  final List<Weather>? weather;
  final Temperature? temp;
}
