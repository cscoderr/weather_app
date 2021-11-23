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
                  GestureDetector(
                    onTap: () => showNotificationBottomSheet(context),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: WeatherColors.secondary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset('assets/svg/notification.svg'),
                    ),
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
              InkWell(
                onTap: () => showForecastReportBottomSheet(context),
                child: Container(
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
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_up,
                        color: WeatherColors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showForecastReportBottomSheet(BuildContext context) {
    showModalBottomSheet<Widget>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 630,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: WeatherColors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  child: Container(
                    width: 100,
                    height: 2,
                    decoration: const BoxDecoration(
                      color: Color(0xFF9D9D9D),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(112, 71, 235, 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Forecast Report',
                          style: WeatherTextStyle.caption.copyWith(
                            color: WeatherColors.primary,
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: WeatherColors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Today',
                  style: WeatherTextStyle.headline4.copyWith(
                    color: WeatherColors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFD5C7FF)),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            '29',
                            style: WeatherTextStyle.caption.copyWith(
                              color: WeatherColors.black,
                            ),
                          ),
                          Text(
                            '29',
                            style: WeatherTextStyle.caption.copyWith(
                              color: WeatherColors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Next forecast',
                  style: WeatherTextStyle.headline4.copyWith(
                    color: WeatherColors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFD5C7FF)),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            '29',
                            style: WeatherTextStyle.caption.copyWith(
                              color: WeatherColors.black,
                            ),
                          ),
                          Text(
                            '29',
                            style: WeatherTextStyle.caption.copyWith(
                              color: WeatherColors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showNotificationBottomSheet(BuildContext context) {
    showModalBottomSheet<Widget>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 450,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: WeatherColors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Align(
                child: Container(
                  width: 100,
                  height: 2,
                  decoration: const BoxDecoration(
                    color: Color(0xFF9D9D9D),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(112, 71, 235, 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Your Notifications',
                    style: WeatherTextStyle.caption.copyWith(
                      color: WeatherColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
