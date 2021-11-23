// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentForecast _$CurrentForecastFromJson(Map<String, dynamic> json) =>
    CurrentForecast(
      dt: json['dt'] as int?,
      weather: json['weather'] as List<Weather>?,
      temp: (json['temp'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CurrentForecastToJson(CurrentForecast instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'weather': instance.weather,
    };
