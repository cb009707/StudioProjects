import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class weatherpage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<weatherpage> {
  String _weather = 'Loading...';
  String _weatherImage = 'assets/loading.png';

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    final double latitude = 25.2582;
    final double longitude = 55.3047;

    try {
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=266e53234afd8f3b8149be9640d6ed98&units=metric'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final double temperature = data['main']['temp'];
        final String description = data['weather'][0]['description'];
        final int humidity = data['main']['humidity'];

        // update weather information and image
        setState(() {
          _weather =
          'Temperature: $temperature°C\nCondition: $description\nHumidity: $humidity%';
          _setWeatherImage(description);
        });
      } else {
        setState(() {
          _weather = 'Failed to load weather data';
        });
      }
    } catch (error) {
      setState(() {
        _weather = 'No internet connection, please connect to wifi or data to view!!!';
      });
    }
  }

  // function to set weather image based on weather condition
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
        title: Text('Dubai Weather'),
      ),
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                _weatherImage,
                height: 100,
                width: 100,
              ),
              SizedBox(height: 30),

              Text(
                _weather,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
