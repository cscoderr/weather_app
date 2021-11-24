import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_api/weather_api.dart';
import 'package:weather_repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(const WeatherState());

  final WeatherRepository _weatherRepository;

  Future<void> fetchAllForecast() async {
    try {
      emit(state.copyWith(status: WeatherStatus.loading));
      final response =
          await _weatherRepository.getForcast(lat: 33.44, lng: -94.04);
      emit(
        state.copyWith(status: WeatherStatus.success, data: response),
      );
    } on ForecastError {
      emit(
        state.copyWith(
          status: WeatherStatus.failure,
          errorMessage: 'Something went wrong, Try again later',
        ),
      );
    }
  }
}
