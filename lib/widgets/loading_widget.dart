import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: 500,
            alignment: Alignment.center,
            child: const Icon(
              Icons.android,
              color: Colors.white,
              size: 50.0,
            ),
          ),
        ),
      ),
    );
  }
}
