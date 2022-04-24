import 'package:flutter/material.dart';
import 'package:flutter_app/weather_screen.dart';

import 'weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final manager = WeatherScreenManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            ValueListenableBuilder<Weather>(
                valueListenable: manager.weatherNotifier,
                builder: (context, value, child) {
                  switch (value) {
                    case Weather.sunny:
                      return Icon(Icons.wb_sunny, size: 100);
                    case Weather.cloudy:
                      return Icon(Icons.wb_cloudy, size: 100);
                    case Weather.rainy:
                      return Icon(Icons.wb_cloudy, size: 100);
                    default:
                      return Icon(Icons.wb_sunny, size: 100);
                  }
                }),
            SizedBox(height: 20),
            ValueListenableBuilder<String>(
              valueListenable: manager.degreeNotifier,
              builder: (context, value, child) {
                return Text(
                  value,
                  style: TextStyle(fontSize: 40),
                );
              },
            ),
            const Text(
              'Ulaanbaatar',
              style: TextStyle(fontSize: 30),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                manager.updateWeather();
              },
              child: Text('Update'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
