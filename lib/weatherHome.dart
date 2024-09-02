import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class WeatherHome extends StatefulWidget {
  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  String? city;
  String? temp;
  String? description;
  String? currentAddress;

  Future<void> _updateLocation() async {
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    currentAddress = "${place.locality}, ${place.country}";

    final weatherResponse = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&units=metric&appid=e42b9722d62b644a3b13549d36292666'));
    final weatherData = jsonDecode(weatherResponse.body);

    setState(() {
      city = weatherData['name'];
      temp = '${weatherData['main']['temp']}°C';
      description = weatherData['weather'][0]['description'];
    });
  }

  String _greeting() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) return 'Bom dia';
    if (hour >= 12 && hour < 18) return 'Boa tarde';
    return 'Boa noite';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_greeting(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateLocation,
              child: Text('Atualizar Localização'),
            ),
            SizedBox(height: 20),
            if (city != null && temp != null && description != null) ...[
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.blue),
                  SizedBox(width: 8),
                  Text('Localização: $currentAddress', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.location_city, color: Colors.green),
                  SizedBox(width: 8),
                  Text('Cidade: $city', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.thermostat, color: Colors.red),
                  SizedBox(width: 8),
                  Text('Temperatura: $temp', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.cloud, color: Colors.grey),
                  SizedBox(width: 8),
                  Text('Descrição: $description', style: TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
