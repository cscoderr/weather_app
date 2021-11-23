import 'package:flutter/material.dart';
import 'package:retro_weather_app/weather/view/weather_page.dart';

/// Weather pages for the weather route
class WeatherPages {
  /// The first page when the app loads
  static const String weather = '/';

  /// Weather notificaiton details page
  static const String notificationDetails = '/notification/details';
}

///The main app routes logic using router generator
class AppRoutes {
  ///list of all the app routes
  static Route route(RouteSettings settings) {
    switch (settings.name) {
      case WeatherPages.weather:
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return const WeatherPage();
          },
        );
      case WeatherPages.notificationDetails:
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return const Text('sds');
          },
        );
      default:
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return const Text('Error');
          },
        );
    }
  }
}
