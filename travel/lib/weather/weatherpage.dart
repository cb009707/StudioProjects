import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class weatherpage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<weatherpage> {
  String _weather = 'Loading...';
  String _weatherImage = 'assets/loading.png';
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _weather = 'Location services are disabled.';
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _weather = 'Location permissions are denied.';
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _weather = 'Location permissions are permanently denied.';
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    fetchWeather(position.latitude, position.longitude);
  }

  Future<void> fetchWeather(double latitude, double longitude) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=266e53234afd8f3b8149be9640d6ed98&units=metric'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final double temperature = data['main']['temp'];
        final String description = data['weather'][0]['description'];
        final int humidity = data['main']['humidity'];

        setState(() {
          _weather = 'Temperature: $temperature°C\nCondition: $description\nHumidity: $humidity%';
          _setWeatherImage(description);
          _hasError = false;
        });
      } else {
        setState(() {
          _weather = 'Failed to load weather data';
          _hasError = true;
        });
      }
    } catch (error) {
      setState(() {
        _weather = 'No internet connection, please connect to wifi or data to view!!!';
        _hasError = true;
      });
    }
  }

  void _setWeatherImage(String description) {
    switch (description) {
      case 'clear sky':
        _weatherImage = 'assets/sunny.png';
        break;
      case 'few clouds':
      case 'scattered clouds':
      case 'broken clouds':
        _weatherImage = 'assets/cloudy.png';
        break;
      case 'shower rain':
      case 'rain':
        _weatherImage = 'assets/rainy.png';
        break;
      default:
        _weatherImage = 'assets/loading.png';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!_hasError && _weatherImage != null)
                Image.asset(
                  _weatherImage,
                  height: 150,
                  width: 150,
                ),
              SizedBox(height: 30),
              Text(
                _weather,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}