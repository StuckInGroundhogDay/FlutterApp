import 'dart:convert';

import 'package:fl_app/weather/current_weather.dart';
import 'package:fl_app/weather/temperature.dart';
import 'package:fl_app/weather/weather_condition.dart';
import 'package:fl_app/weather/weather_unit.dart';
import 'package:http/http.dart' as http;

class WeatherData {
  static const String defaultCity = "Omsk";

  String city;

  CurrentWeather? currentWeather;

  List<WeatherUnit> hourlyForecastUnits = [];
  List<WeatherUnit> dailyForecastUnits = [];

  WeatherData({this.city = defaultCity}) {
    getWeatherData(city);
  }

  Future getWeatherData(String city) async {
    hourlyForecastUnits = [];
    dailyForecastUnits = [];

    final queryParameters = {
      'q': this.city,
      'appid': '9722d722e73183183c66f09eaaf34865',
      'cnt': '40',
      'units': 'metric',
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/forecast', queryParameters);
    final response = await http.get(uri);

    final json = jsonDecode(response.body);

    final jsonDays = json['list'];

    for (int i = 0; i < 5; i++) {
      hourlyForecastUnits.add(
        WeatherUnit(
          temperature: Temperature(
            averageTemperature: jsonDays[i]['main']['temp'].toInt(),
            minTemperature: jsonDays[i]['main']['temp_min'].toInt(),
            maxTemperature: jsonDays[i]['main']['temp_max'].toInt(),
            feelsLike: jsonDays[i]['main']['feels_like'].toInt(),
          ),
          weatherCondition: WeatherCondition(
            id: jsonDays[i]['weather'][0]['id'].toInt(),
            condition: jsonDays[i]['weather'][0]['main'],
            description: jsonDays[i]['weather'][0]['description'],
          ),
        ),
      );
    }

    this.city = city;
  }
}
