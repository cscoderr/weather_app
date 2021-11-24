import 'package:dio/dio.dart';
import 'package:weather_api/weather_api.dart';

class ForecastError implements Exception {}

/// {@template weather_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class WeatherRepository {
  /// {@macro weather_repository}
  WeatherRepository({WeatherApi? weatherApi})
      : _weatherApi = weatherApi ?? WeatherApi(Dio());

  final WeatherApi _weatherApi;

  static const _apiKey = '6654d56df4891b1581855403035b22d9';

  /// Get all the current forcast data from network
  Future<Forecast> getForcast({double? lat, double? lng}) async {
    try {
      final response = await _weatherApi.getAllForcast(lat!, lng!, _apiKey);
      print(response.current);
      return response;
    } on DioError catch (e) {
      print(e);
      throw ForecastError();
    } on Exception catch (e) {
      print(e);
      throw ForecastError();
    }
  }
}
