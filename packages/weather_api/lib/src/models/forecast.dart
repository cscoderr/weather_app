import 'package:json_annotation/json_annotation.dart';
import 'package:weather_api/weather_api.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  const Forecast({
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
