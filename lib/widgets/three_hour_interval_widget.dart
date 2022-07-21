import 'package:flutter/material.dart';
import 'package:fl_app/weather/interval_temperature_unit.dart';
import 'package:fl_app/weather/weather_unit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fl_app/time_from_today.dart';

class ThreeHourIntervalWidget extends StatelessWidget {
  final WeatherUnit<IntervalTemperatureUnit> weatherUnit;
  final int threeHourIndex;

  const ThreeHourIntervalWidget({
    Key? key,
    required this.weatherUnit,
    required this.threeHourIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 60,
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 38,
            height: 38,
            padding: const EdgeInsets.all(4.0),
            child: SvgPicture.asset(weatherUnit.weatherConditionUnit.path),
          ),
          Text(
            ' ${weatherUnit.temperatureUnit.averageTemperature}°',
            style: const TextStyle(fontSize: 17, color: Colors.white),
          ),
          Text(
            '${TimeFromToday.getDayOfWeek(threeHourIndex)}',
            style: const TextStyle(fontSize: 17, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
