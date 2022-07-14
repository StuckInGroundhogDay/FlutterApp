import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fl_app/day_weather.dart';
import 'package:fl_app/day_temperature.dart';

class WeatherForecast {
  static final DayWeather defaultDayWeather = DayWeather(
    weatherStatus: DayWeather.defaultWeatherStatus,
    weatherDescriptionStatus: DayWeather.defaultWeatherDescriptionStatus,
    feelsLike: DayWeather.defaultFeelsLike,
    temperature: DayWeather.defaultDayTemperature,
  );
  static final List<DayWeather> defaultDays = [
    defaultDayWeather,
    defaultDayWeather,
    defaultDayWeather,
    defaultDayWeather,
    defaultDayWeather,
  ];
  static const String defaultCity = 'Omsk';

  List<DayWeather> days;
  String city;

  WeatherForecast({
    required this.days,
    required this.city,
  });

  Future getWeather(String city) async {
    this.city = city;

    final queryParameters = {
      'q': this.city,
      'appid': '9722d722e73183183c66f09eaaf34865',
      'cnt': '5',
      'units': 'metric',
    };

    final url = Uri.https(
        'api.openweathermap.org', '/data/2.5/forecast', queryParameters);
    final response = await http.get(url);

    final json = jsonDecode(response.body);

    final jsonDays = json['list'];
    for (int i = 0; i < 5; i++) {
      days[i] = DayWeather(
        weatherStatus: jsonDays[i]['weather'][0]['main'],
        weatherDescriptionStatus: jsonDays[i]['weather'][0]['description'],
        feelsLike: jsonDays[i]['main']['feels_like'].toInt(),
        temperature: DayTemperature(
          averageTemperature: jsonDays[i]['main']['temp'].toInt(),
          minTemperature: jsonDays[i]['main']['temp_min'].toInt(),
          maxTemperature: jsonDays[i]['main']['temp_max'].toInt(),
        ),
      );
    }
  }
}
