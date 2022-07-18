import 'package:fl_app/weather/weather_unit.dart';
import 'package:flutter/material.dart';

class CurrentWeather extends StatelessWidget {
  final String city;
  final WeatherUnit weatherUnit;

  const CurrentWeather({
    Key? key,
    required this.city,
    required this.weatherUnit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      width: double.infinity,
      padding: const EdgeInsets.all(2.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            city,
            style: const TextStyle(fontSize: 35, color: Colors.white),
            textAlign: TextAlign.left,
          ),
          const Text(
            'Right now',
            style: TextStyle(fontSize: 15, color: Colors.white),
            textAlign: TextAlign.left,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/scattered_clouds.png'),
                height: 80,
                width: 80,
              ),
              Text(
                '${weatherUnit.temperatureUnit.averageTemperature}°',
                style: const TextStyle(fontSize: 60, color: Colors.white),
              ),
            ],
          ),
          Text(
            'Feels like ${weatherUnit.temperatureUnit.feelsLike}°, ${weatherUnit.weatherConditionUnit.description}.',
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
