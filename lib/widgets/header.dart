import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      width: double.infinity,
      height: 45,
      padding: const EdgeInsets.all(2.5),
      child: const Text(
        'Day weather forecast',
        style: TextStyle(fontSize: 25, color: Colors.white),
      ),
    );
  }
}
