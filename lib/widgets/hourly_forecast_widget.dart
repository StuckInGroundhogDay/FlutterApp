import 'package:fl_app/widgets/three_hour_interval_widget.dart';
import 'package:flutter/material.dart';
import 'package:fl_app/weather/weather_unit.dart';
import 'package:fl_app/weather/interval_temperature_unit.dart';

class HourlyForecastWidget extends StatelessWidget {
  final List<WeatherUnit<IntervalTemperatureUnit>> threeHourIntervals;

  const HourlyForecastWidget({Key? key, required this.threeHourIntervals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ThreeHourIntervalWidget> threeHourIntervalWidgets = [];

    for (int i = 0; i < 8; i++) {
      threeHourIntervalWidgets.add(ThreeHourIntervalWidget(
          weatherUnit: threeHourIntervals[i], threeHourIndex: i));
    }

    return SizedBox(
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: threeHourIntervalWidgets,
      ),
    );
  }
}
