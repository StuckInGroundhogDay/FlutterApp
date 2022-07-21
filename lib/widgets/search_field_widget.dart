import 'package:fl_app/weather/weather_data.dart';
import 'package:flutter/material.dart';

class SearchFieldWidget extends StatefulWidget {
  final WeatherData weatherData;

  const SearchFieldWidget({Key? key, required this.weatherData})
      : super(key: key);

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  void _onSubmitted(String city) {
    if (city != "") {
      widget.weatherData
          .receiveDataFromSever(city)
          .then((value) => setState(() {}));
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      decoration: const InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.black12,
        filled: true,
        hintText: "Search city",
        hintStyle: TextStyle(color: Colors.white),
        icon: Icon(Icons.login, color: Colors.white),
      ),
      onSubmitted: _onSubmitted,
      style: const TextStyle(color: Colors.white),
    );
  }
}
