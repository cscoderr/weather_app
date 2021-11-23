import 'package:flutter/material.dart';
import 'package:retro_weather_app/app/app.dart';
import 'package:weather_repository/weather_repository.dart';

void main() {
  runApp(
    App(
      weatherRepository: WeatherRepository(),
    ),
  );
}
