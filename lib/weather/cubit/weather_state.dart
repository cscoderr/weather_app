part of 'weather_cubit.dart';

enum WeatherStatus {
  loading,
  success,
  failure,
}

class WeatherState extends Equatable {
  const WeatherState({
    this.status = WeatherStatus.loading,
  });

  WeatherState copyWith({
    WeatherStatus? status,
  }) {
    return WeatherState(
      status: status ?? this.status,
    );
  }

  final WeatherStatus status;
  // final Weather weather;
  @override
  List<Object?> get props => [status];
}
