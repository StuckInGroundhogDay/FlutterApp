import 'dart:convert';

import 'package:fl_app/weather/current_temperature_unit.dart';
import 'package:fl_app/weather/interval_temperature_unit.dart';
import 'package:fl_app/weather/weather_condition_unit.dart';
import 'package:fl_app/weather/weather_unit.dart';
import 'package:http/http.dart' as http;

class WeatherData {
  static const String defaultCity = "Omsk";

  String city;

  WeatherUnit? currentWeather;
  List<WeatherUnit> threeHourIntervals = [];
  List<WeatherUnit> dayIntervals = [];

  WeatherData({this.city = defaultCity}) {
    receiveDataFromSever(city);
  }

  Future receiveDataFromSever(String city) async {
    threeHourIntervals = [];
    dayIntervals = [];

    final parametersForIntervals = {
      'q': this.city,
      'appid': '9722d722e73183183c66f09eaaf34865',
      'cnt': '40',
      'units': 'metric',
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/forecast', parametersForIntervals);
    final response = await http.get(uri);

    final json = jsonDecode(response.body);

    final jsonDays = json['list'];

    for (int i = 0; i < 40; i++) {
      threeHourIntervals.add(
        WeatherUnit(
          temperatureUnit: IntervalTemperatureUnit(
            averageTemperature: jsonDays[i]['main']['temp'].toInt(),
            minTemperature: jsonDays[i]['main']['temp_min'].toInt(),
            maxTemperature: jsonDays[i]['main']['temp_max'].toInt(),
            feelsLike: jsonDays[i]['main']['feels_like'].toInt(),
          ),
          weatherConditionUnit: WeatherConditionUnit(
            id: jsonDays[i]['weather'][0]['id'].toInt(),
            condition: jsonDays[i]['weather'][0]['main'],
            description: jsonDays[i]['weather'][0]['description'],
          ),
        ),
      );
      // TO DO ИСПРАВИТЬ КОД
      if (i % 8 == 7) {
        dayIntervals.add(
          WeatherUnit(
            temperatureUnit: IntervalTemperatureUnit(
              averageTemperature: jsonDays[i]['main']['temp'].toInt(),
              minTemperature: jsonDays[i]['main']['temp_min'].toInt(),
              maxTemperature: jsonDays[i]['main']['temp_max'].toInt(),
              feelsLike: jsonDays[i]['main']['feels_like'].toInt(),
            ),
            weatherConditionUnit: WeatherConditionUnit(
              id: jsonDays[i - 3]['weather'][0]['id'].toInt(),
              condition: jsonDays[i - 3]['weather'][0]['main'],
              description: jsonDays[i - 3]['weather'][0]['description'],
            ),
          ),
        );
      }
    }

    // TO DO ЗАРЕФАКТИТЬ КОД
    final parametersForCurrentWeather = {
      'q': this.city,
      'appid': '9722d722e73183183c66f09eaaf34865',
      'units': 'metric',
    };

    final uri2 = Uri.https('api.openweathermap.org', '/data/2.5/weather',
        parametersForCurrentWeather);
    final response2 = await http.get(uri2);

    final json2 = jsonDecode(response2.body);

    final jsonDays2 = json2['list'];

    currentWeather = WeatherUnit(
      temperatureUnit: CurrentTemperatureUnit(
        currentTemperature: jsonDays2[0]['main']['temp'].toInt(),
        feelsLike: jsonDays2[0]['main']['feels_like'].toInt(),
      ),
      weatherConditionUnit: WeatherConditionUnit(
        id: jsonDays2[0]['weather'][0]['id'].toInt(),
        condition: jsonDays2[0]['weather'][0]['main'],
        description: jsonDays2[0]['weather'][0]['description'],
      ),
    );

    this.city = city;
  }
}
