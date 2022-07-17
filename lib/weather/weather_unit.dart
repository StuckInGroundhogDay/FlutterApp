import 'package:fl_app/weather/weather_condition.dart';
import 'package:fl_app/weather/temperature.dart';

class WeatherUnit {
  Temperature temperature;
  WeatherCondition weatherCondition;

  WeatherUnit({
    required this.temperature,
    required this.weatherCondition,
  });
}
