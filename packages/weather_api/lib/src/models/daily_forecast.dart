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

  // double get toCelsius => temp!. - 273;

  // double get toFahrenheit => ((9 / 5) * toFahrenheit) + 32;

  DateTime get date =>
      DateTime.fromMillisecondsSinceEpoch(dt! * 1000, isUtc: false);
}
