import 'package:fl_app/weather/weather_condition_unit.dart';

class WeatherUnit<T> {
  // temperatureUnit MUST receive an instance of CurrentTemperatureUnit or IntervalTemperatureUnit
  T temperatureUnit;
  WeatherConditionUnit weatherConditionUnit;

  WeatherUnit({
    required this.temperatureUnit,
    required this.weatherConditionUnit,
  });
}
