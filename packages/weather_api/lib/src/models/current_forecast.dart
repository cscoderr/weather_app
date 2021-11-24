import 'package:json_annotation/json_annotation.dart';
import 'package:weather_api/weather_api.dart';

part 'current_forecast.g.dart';

@JsonSerializable()
class CurrentForecast {
  CurrentForecast({this.dt, this.weather, this.temp});

  factory CurrentForecast.fromJson(Map<String, dynamic> json) =>
      _$CurrentForecastFromJson(json);

  final int? dt;
  final double? temp;
  final List<Weather>? weather;

  double get toCelsius => temp! - 273;

  double get toFahrenheit => ((9 / 5) * toFahrenheit) + 32;

  DateTime get date =>
      DateTime.fromMillisecondsSinceEpoch(dt! * 1000, isUtc: false);
}
