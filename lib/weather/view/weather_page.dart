import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:retro_weather_app/weather/cubit/weather_cubit.dart';
import 'package:retro_weather_app/weather/weather.dart';
import 'package:weather_api/weather_api.dart';
import 'package:weather_repository/weather_repository.dart';
import 'package:weather_ui/weather_ui.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(
        context.read<WeatherRepository>(),
      )..fetchAllForecast(),
      child: const WeatherView(),
    );
  }
}

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: BlocConsumer<WeatherCubit, WeatherState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.status == WeatherStatus.success) {
                return Column(
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
                          onTap: () =>
                              showNotificationBottomSheet(context, state.data),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: WeatherColors.secondary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:
                                SvgPicture.asset('assets/svg/notification.svg'),
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
                                    style:
                                        WeatherTextStyle.headline3.copyWith(),
                                  ),
                                  Text(
                                    DateFormat.MMMEd()
                                        .format(state.data.current!.date),
                                    style:
                                        WeatherTextStyle.smallText.copyWith(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                state.data.current!.toCelsius
                                    .round()
                                    .toString(),
                                style: WeatherTextStyle.headline1.copyWith(
                                  fontSize: 130,
                                  // letterSpacing: 0.5,
                                ),
                              ),
                              Text(
                                '°C',
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
                                  text: DateFormat.jm().format(DateTime.now()),
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
                      onTap: () => showForecastReportBottomSheet(
                        context,
                        state.data,
                      ),
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
                );
              } else if (state.status == WeatherStatus.failure) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: WeatherTextStyle.headline4,
                  ),
                );
              } else if (state.status == WeatherStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void showForecastReportBottomSheet(BuildContext context, Forecast data) {
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
          height: MediaQuery.of(context).size.height / 0.5,
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
                  child: InkWell(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
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
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFD5C7FF)),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Row(
                    children: List.generate(5, (index) {
                      return Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  data.hourly![index * 2].toCelsius
                                      .round()
                                      .toString(),
                                  style: WeatherTextStyle.overline.copyWith(
                                    color: WeatherColors.black,
                                    letterSpacing: 0.14,
                                  ),
                                ),
                                Text(
                                  '°C',
                                  style: WeatherTextStyle.caption.copyWith(
                                    color: WeatherColors.black,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            SvgPicture.asset(
                              'assets/svg/weathericon.svg',
                              width: 31,
                              height: 18,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              DateFormat.jm()
                                  .format(data.hourly![index * 2].date),
                              style: WeatherTextStyle.caption.copyWith(
                                color: WeatherColors.black,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      'Next forecast',
                      style: WeatherTextStyle.headline4.copyWith(
                        color: WeatherColors.black,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: WeatherColors.primary,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        'Five Days',
                        style: WeatherTextStyle.caption,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFD5C7FF)),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Column(
                    children: List.generate(5, (index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DateFormat.MMMMd()
                                    .format(data.daily![index + 2].date),
                                style: WeatherTextStyle.caption.copyWith(
                                  color: WeatherColors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SvgPicture.asset(
                                'assets/svg/weathericon.svg',
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data.daily![index + 2].temp!.day!
                                        .round()
                                        .toString(),
                                    style: WeatherTextStyle.overline.copyWith(
                                      color: WeatherColors.black,
                                      letterSpacing: 0.14,
                                    ),
                                  ),
                                  Text(
                                    '°C',
                                    style: WeatherTextStyle.caption.copyWith(
                                      color: WeatherColors.black,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showNotificationBottomSheet(BuildContext context, Forecast data) {
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
                child: InkWell(
                  onTap: () => Navigator.of(context).maybePop(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate(
                  data.daily!.length,
                  (index) {
                    return NotificationTile();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
