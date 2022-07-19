import 'package:fl_app/widgets/day_interval_widget.dart';
import 'package:flutter/material.dart';
import 'package:fl_app/weather/weather_unit.dart';
import 'package:fl_app/weather/interval_temperature_unit.dart';

class DailyForecastWidget extends StatelessWidget {
  final List<WeatherUnit<IntervalTemperatureUnit>> dayIntervals;

  const DailyForecastWidget({Key? key, required this.dayIntervals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DayIntervalWidget> dayIntervalWidgets = [];

    for (int i = 0; i < 5; i++) {
      dayIntervalWidgets
          .add(DayIntervalWidget(weatherUnit: dayIntervals[i]));
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
          width: double.infinity,
          height: 45,
          padding: const EdgeInsets.all(2.5),
          child: const Text(
            'Day weather forecast',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        Column(children: dayIntervalWidgets),
      ],
    );
  }
}
