import 'package:fl_app/day_temperature.dart';

class DayWeather {
  static const String defaultWeatherStatus = 'Clouds';
  static const String defaultWeatherDescriptionStatus = 'overcast clouds';
  static const int defaultFeelsLike = 20;
  static final DayTemperature defaultDayTemperature = DayTemperature(
      averageTemperature: DayTemperature.defaultAverageTemperature,
      minTemperature: DayTemperature.defaultMaxTemperature,
      maxTemperature: DayTemperature.defaultMinTemperature);

  String weatherStatus;
  String weatherDescriptionStatus;
  int feelsLike;
  DayTemperature temperature;

  DayWeather({
    required this.weatherStatus,
    required this.weatherDescriptionStatus,
    required this.feelsLike,
    required this.temperature,
  });
}
