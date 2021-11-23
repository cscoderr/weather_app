// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_repository/weather_repository.dart';

void main() {
  group('WeatherRepository', () {
    test('can be instantiated', () {
      expect(WeatherRepository(), isNotNull);
    });
  });
}
