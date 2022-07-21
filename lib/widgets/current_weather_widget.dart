import 'package:fl_app/weather/current_temperature_unit.dart';
import 'package:fl_app/weather/weather_unit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final String city;
  final WeatherUnit<CurrentTemperatureUnit> weatherUnit;

  const CurrentWeatherWidget({
    Key? key,
    required this.city,
    required this.weatherUnit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(2.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            city,
            style: const TextStyle(fontSize: 40, color: Colors.white),
            textAlign: TextAlign.left,
          ),
          const Text(
            'Right now',
            style: TextStyle(fontSize: 17, color: Colors.white),
            textAlign: TextAlign.left,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                padding: const EdgeInsets.all(5.0),
                child: SvgPicture.asset(weatherUnit.weatherConditionUnit.path),
              ),
              Text(
                '${weatherUnit.temperatureUnit.currentTemperature}°',
                style: const TextStyle(fontSize: 70, color: Colors.white),
              ),
            ],
          ),
          Text(
            'Feels like ${weatherUnit.temperatureUnit.feelsLike}°, ${weatherUnit.weatherConditionUnit.description}.',
            style: const TextStyle(fontSize: 17, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
