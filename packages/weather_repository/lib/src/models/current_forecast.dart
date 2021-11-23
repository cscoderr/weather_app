import 'package:json_annotation/json_annotation.dart';
import 'package:weather_repository/weather_repository.dart';

part 'current_forecast.g.dart';

@JsonSerializable()
class CurrentForecast {
  CurrentForecast({this.dt, this.weather, this.temp});

  factory CurrentForecast.fromJson(Map<String, dynamic> json) =>
      _$CurrentForecastFromJson(json);

  final int? dt;
  final double? temp;
  final List<Weather>? weather;
}
