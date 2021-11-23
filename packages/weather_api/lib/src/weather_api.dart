import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_api/weather_api.dart';

part 'weather_api.g.dart';

/// {@template weather_api}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}

@RestApi(baseUrl: 'https://api.openweathermap.org/')
abstract class WeatherApi {
  /// {@macro weather_api}
  factory WeatherApi(Dio dio, {String baseUrl}) = _WeatherApi;

  /// {@macro get all the current weather data}
  @GET('data/2.5/onecall')
  Future<Forecast> getAllForcast(
    @Query('lat') double lat,
    @Query('lng') double lng,
    @Query('appId') String appId,
  );
}
