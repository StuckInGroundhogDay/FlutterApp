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
      weatherData.receiveDataFromSever(city).then((value) {
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (weatherData.isReceivedForTheFirstTime) {
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
    } else {
      weatherData.receiveDataFromSever(WeatherData.defaultCity).then((value) {
        setState(() {});
      });
      return MaterialApp(
        title: 'Weather Forecast',
        home: Scaffold(
          backgroundColor: Colors.black87,
          body: SingleChildScrollView(
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              width: double.infinity,
              height: 45,
              padding: const EdgeInsets.all(2.5),
              alignment: Alignment.center,
              child: const Text(
                'Loading',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
        ),
      );
    }
  }
}
