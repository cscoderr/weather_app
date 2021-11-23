import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/src/models/daily_forecast.dart';
import 'package:weather_repository/weather_repository.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  Forecast({
    this.current,
    this.hourly,
    this.daily,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  final CurrentForecast? current;
  final List<CurrentForecast>? hourly;
  final List<DailyForecast>? daily;
}
