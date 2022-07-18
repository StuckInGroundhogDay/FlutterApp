import 'package:fl_app/weather/weather_data.dart';
import 'package:fl_app/widgets/day_interval.dart';
import 'package:fl_app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:fl_app/widgets/current_weather.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  WeatherData weatherData = WeatherData();

  void _onSubmitted(String city) {
    if (city != "") {
      weatherData.receiveDataFromSever(city);

      Future.delayed(const Duration(milliseconds: 2000), () {
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                keyboardAppearance: Brightness.dark,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.login, color: Colors.white),
                  hintText: "Search city",
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.black12,
                  filled: true,
                ),
                onSubmitted: _onSubmitted,
              ),
              CurrentWeather(city: weatherData.city, weatherUnit: weatherData.dayIntervals[0]),
              const Header(),
              Column(
                children: [
                  DayInterval(weatherUnit: weatherData.dayIntervals[0]),
                  DayInterval(weatherUnit: weatherData.dayIntervals[1]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
