part of 'weather_cubit.dart';

enum WeatherStatus {
  loading,
  success,
  failure,
}

class WeatherState extends Equatable {
  const WeatherState({
    this.status = WeatherStatus.loading,
    this.errorMessage = '',
    this.data = const Forecast(),
  });

  WeatherState copyWith({
    WeatherStatus? status,
    String? errorMessage,
    Forecast? data,
  }) {
    return WeatherState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
    );
  }

  final Forecast data;
  final String errorMessage;
  final WeatherStatus status;
  // final Weather weather;
  @override
  List<Object?> get props => [status, errorMessage, data];
}
