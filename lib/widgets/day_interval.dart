import 'package:fl_app/time_from_today.dart';
import 'package:fl_app/weather/weather_unit.dart';
import 'package:flutter/material.dart';

class DayInterval extends StatelessWidget {
  final WeatherUnit weatherUnit;

  const DayInterval({Key? key, required this.weatherUnit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      width: double.infinity,
      height: 30,
      padding: const EdgeInsets.all(2.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherUnit.weatherConditionUnit.condition,
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
          const Image(
            image: AssetImage('assets/images/scattered_clouds.png'),
            height: 22,
            width: 22,
          ),
          Text(
            '${weatherUnit.temperatureUnit.averageTemperature}° ${TimeFromToday.getDate(0)} ${TimeFromToday.getDayOfWeek(0)}',
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
