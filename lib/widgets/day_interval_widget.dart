import 'package:fl_app/time_from_today.dart';
import 'package:fl_app/weather/interval_temperature_unit.dart';
import 'package:fl_app/weather/weather_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DayIntervalWidget extends StatelessWidget {
  final WeatherUnit<IntervalTemperatureUnit> weatherUnit;
  final int dayIndex;

  const DayIntervalWidget({
    Key? key,
    required this.weatherUnit,
    required this.dayIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherUnit.weatherConditionUnit.condition,
            style: const TextStyle(fontSize: 17, color: Colors.white),
          ),
          Container(
            width: 28,
            height: 28,
            padding: const EdgeInsets.all(4.0),
            child: SvgPicture.asset(weatherUnit.weatherConditionUnit.path),
          ),
          Text(
            '${weatherUnit.temperatureUnit.averageTemperature}° ${TimeFromToday.getDate(dayIndex)} ${TimeFromToday.getDayOfWeek(dayIndex)}',
            style: const TextStyle(fontSize: 17, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
