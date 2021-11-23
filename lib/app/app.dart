import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retro_weather_app/app/app_routes.dart';
import 'package:weather_repository/weather_repository.dart';
import 'package:weather_ui/weather_ui.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.weatherRepository}) : super(key: key);

  final WeatherRepository weatherRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: weatherRepository),
      ],
      child: const _App(),
    );
  }
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: WeatherColors.primary,
      ),
      onGenerateRoute: AppRoutes.route,
      initialRoute: WeatherPages.weather,
    );
  }
}
