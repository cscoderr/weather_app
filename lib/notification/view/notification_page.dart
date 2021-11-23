import 'package:flutter/material.dart';
import 'package:retro_weather_app/notification/notification.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          NotificationTile(),
        ],
      ),
    );
  }
}
