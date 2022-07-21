import 'package:fl_app/weather/weather_data.dart';
import 'package:fl_app/widgets/current_weather_widget.dart';
import 'package:fl_app/widgets/daily_forecast_widget.dart';
import 'package:fl_app/widgets/hourly_forecast_widget.dart';
import 'package:fl_app/widgets/search_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:fl_app/widgets/loading_widget.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  WeatherData weatherData = WeatherData();

  @override
  void initState() {
    super.initState();
    weatherData
        .receiveDataFromSever(WeatherData.defaultCity)
        .then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    if (!weatherData.isReceivedForTheFirstTime) {
      return const LoadingWidget();
    } else {
      return MaterialApp(
        title: 'Weather Forecast',
        home: Scaffold(
          backgroundColor: Colors.black87,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SearchFieldWidget(weatherData: weatherData),
                CurrentWeatherWidget(
                    city: weatherData.city,
                    weatherUnit: weatherData.currentWeather),
                HourlyForecastWidget(threeHourIntervals: weatherData.threeHourIntervals),
                DailyForecastWidget(dayIntervals: weatherData.dayIntervals),
              ],
            ),
          ),
        ),
      );
    }
  }
}
