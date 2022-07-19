import 'package:fl_app/weather/weather_data.dart';
import 'package:fl_app/widgets/current_weather_widget.dart';
import 'package:fl_app/widgets/daily_forecast_widget.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
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
              CurrentWeatherWidget(
                city: weatherData.city,
                weatherUnit: weatherData.currentWeather,
              ),
              DailyForecastWidget(dayIntervals: weatherData.dayIntervals),
            ],
          ),
        ),
      ),
    );
  }
}
