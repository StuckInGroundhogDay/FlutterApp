import 'package:fl_app/weather/interval_temperature_unit.dart';
import 'package:fl_app/weather/weather_unit.dart';
import 'package:fl_app/widgets/day_interval_widget.dart';
import 'package:flutter/material.dart';

class DailyForecastWidget extends StatelessWidget {
  final List<WeatherUnit<IntervalTemperatureUnit>> dayIntervals;

  const DailyForecastWidget({Key? key, required this.dayIntervals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DayIntervalWidget> dayIntervalWidgets = [];

    for (int i = 0; i < 5; i++) {
      dayIntervalWidgets
          .add(DayIntervalWidget(weatherUnit: dayIntervals[i], dayIndex: i));
    }

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 45,
          alignment: Alignment.center,
          child: const Text(
            'Weather Forecast',
            style: TextStyle(fontSize: 27, color: Colors.white),
          ),
        ),
        Column(children: dayIntervalWidgets),
      ],
    );
  }
}
