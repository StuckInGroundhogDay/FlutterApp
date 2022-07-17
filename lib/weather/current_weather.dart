import 'package:fl_app/weather/weather_condition.dart';

class CurrentWeather {
  WeatherCondition weatherCondition;
  int feelsLike;
  int currentTemperature;

  CurrentWeather({
    required this.weatherCondition,
    required this.currentTemperature,
    required this.feelsLike,
  });
}
