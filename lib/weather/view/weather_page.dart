import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_ui/weather_ui.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: WeatherColors.secondary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svg/location.svg'),
                        const SizedBox(width: 10),
                        Text(
                          'Lagos, Nigeria',
                          style: WeatherTextStyle.caption.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: WeatherColors.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset('assets/svg/notification.svg'),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: WeatherColors.primaryBorder,
                  ),
                  borderRadius: BorderRadius.circular(15.4),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svg/weather.svg'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Today',
                              style: WeatherTextStyle.headline3.copyWith(),
                            ),
                            Text(
                              'Mon, 26 Apr',
                              style: WeatherTextStyle.smallText.copyWith(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '28',
                          style: WeatherTextStyle.headline1.copyWith(
                            fontSize: 154.327,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text(
                          'oC',
                          style: WeatherTextStyle.caption.copyWith(
                            fontSize: 19.2909,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Lagos, Nigeria .',
                        style: WeatherTextStyle.caption.copyWith(
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: ' 2:00 p.m',
                            style: WeatherTextStyle.caption.copyWith(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: WeatherColors.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Forecast report',
                      style: WeatherTextStyle.headline5,
                    ),
                    const Icon(
                      Icons.keyboard_arrow_up,
                      color: WeatherColors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
