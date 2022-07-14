import 'package:flutter/material.dart';

import 'package:fl_app/weather_forecast.dart';
import 'package:fl_app/time_from_today.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  WeatherForecast weatherForecast = WeatherForecast(
      days: WeatherForecast.defaultDays, city: WeatherForecast.defaultCity);

  void _onSubmitted(String city) {
    if (city != "") {
      weatherForecast.getWeather(city);

      Future.delayed(const Duration(milliseconds: 2000), () {
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    weatherForecast.getWeather(weatherForecast.city);

    return MaterialApp(
      title: 'Weather Forecast',
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: SingleChildScrollView(
          child: Column(children: [
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
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                width: double.infinity,
                padding: const EdgeInsets.all(2.5),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        //alignment: Alignment.centerLeft,
                        child: Text(
                          weatherForecast.city,
                          style: const TextStyle(
                              fontSize: 35, color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const Align(
                        //alignment: Alignment.centerLeft,
                        child: Text(
                          'Right now',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                                image: AssetImage('assets/sun.png'),
                                height: 80,
                                width: 80),
                            Text(
                                '${weatherForecast.days[0].temperature.averageTemperature}°',
                                style: const TextStyle(
                                    fontSize: 60, color: Colors.white))
                          ]),
                      SizedBox(
                        child: Center(
                          child: Text(
                              'Feels like ${weatherForecast.days[0].feelsLike}°, ${weatherForecast.days[0].weatherDescriptionStatus}.',
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white)),
                        ),
                      ),
                    ])),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                width: double.infinity,
                height: 45,
                padding: const EdgeInsets.all(2.5),
                child: Align(
                    //alignment: Alignment.centerLeft,
                    child: Text('Day weather forecast',
                        style: TextStyle(fontSize: 25, color: Colors.white)))),
            Column(children: [
              Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 2.0),
                  width: double.infinity,
                  height: 30,
                  padding: const EdgeInsets.all(2.5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(weatherForecast.days[0].weatherStatus,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white)),
                        const Image(
                            image: AssetImage('assets/sun.png'),
                            height: 22,
                            width: 22),
                        Text(
                            '${weatherForecast.days[0].temperature.averageTemperature}° ${TimeFromToday.getDayOfMonth(0)} ${TimeFromToday.getDayOfWeek(0)}',
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white))
                      ])),
              Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 2.0),
                  width: double.infinity,
                  height: 30,
                  padding: const EdgeInsets.all(2.5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(weatherForecast.days[1].weatherStatus,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white)),
                        const Image(
                            image: AssetImage('assets/sun.png'),
                            height: 22,
                            width: 22),
                        Text(
                            '${weatherForecast.days[1].temperature.averageTemperature}° ${TimeFromToday.getDayOfMonth(1)} ${TimeFromToday.getDayOfWeek(1)}',
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white))
                      ])),
              Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 2.0),
                  width: double.infinity,
                  height: 30,
                  padding: const EdgeInsets.all(2.5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(weatherForecast.days[2].weatherStatus,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white)),
                        const Image(
                            image: AssetImage('assets/sun.png'),
                            height: 22,
                            width: 22),
                        Text(
                            '${weatherForecast.days[2].temperature.averageTemperature}° ${TimeFromToday.getDayOfMonth(2)} ${TimeFromToday.getDayOfWeek(2)}',
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white))
                      ])),
              Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 2.0),
                  width: double.infinity,
                  height: 30,
                  padding: const EdgeInsets.all(2.5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(weatherForecast.days[3].weatherStatus,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white)),
                        const Image(
                            image: AssetImage('assets/sun.png'),
                            height: 22,
                            width: 22),
                        Text(
                            '${weatherForecast.days[3].temperature.averageTemperature}° ${TimeFromToday.getDayOfMonth(3)} ${TimeFromToday.getDayOfWeek(3)}',
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white))
                      ])),
              Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 2.0),
                  width: double.infinity,
                  height: 30,
                  padding: const EdgeInsets.all(2.5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(weatherForecast.days[4].weatherStatus,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white)),
                        const Image(
                            image: AssetImage('assets/sun.png'),
                            height: 22,
                            width: 22),
                        Text(
                            '${weatherForecast.days[4].temperature.averageTemperature}° ${TimeFromToday.getDayOfMonth(4)} ${TimeFromToday.getDayOfWeek(4)}',
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white))
                      ])),
            ]),
          ]),
        ),
      ),
    );
  }
}
