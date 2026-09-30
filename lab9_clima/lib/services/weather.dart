import 'package:flutter/foundation.dart';

import 'location.dart';
import 'networking.dart';

// Open-Meteo is free and doesn't need an API key
const forecastURL = 'https://api.open-meteo.com/v1/forecast';
const geocodingURL = 'https://geocoding-api.open-meteo.com/v1/search';
const reverseGeocodingURL =
    'https://api.bigdatacloud.net/data/reverse-geocode-client';

class WeatherData {
  WeatherData({
    required this.temperature,
    required this.condition,
    required this.cityName,
  });

  final double temperature;
  final int condition; // WMO weather code
  final String cityName;
}

class WeatherModel {
  Future<WeatherData?> getWeatherByCoords(
    double lat,
    double lon,
    String cityName,
  ) async {
    final helper = NetworkHelper(
      '$forecastURL?latitude=$lat&longitude=$lon&current=temperature_2m,weather_code',
    );
    final data = await helper.getData();
    if (data == null) return null;

    return WeatherData(
      temperature: (data['current']['temperature_2m'] as num).toDouble(),
      condition: data['current']['weather_code'] as int,
      cityName: cityName,
    );
  }

  Future<WeatherData?> getLocationWeather() async {
    final location = Location();
    await location.getCurrentLocation();

    var cityName = 'Da Nang';
    if (!location.isDefault) {
      cityName = await _getCityName(location.latitude, location.longitude);
    }
    return getWeatherByCoords(location.latitude, location.longitude, cityName);
  }

  Future<WeatherData?> getCityWeather(String cityName) async {
    final helper = NetworkHelper(
      '$geocodingURL?name=${Uri.encodeComponent(cityName)}&count=1',
    );
    final data = await helper.getData();
    if (data == null || data['results'] == null) return null;

    final city = data['results'][0];
    return getWeatherByCoords(
      (city['latitude'] as num).toDouble(),
      (city['longitude'] as num).toDouble(),
      city['name'],
    );
  }

  Future<String> _getCityName(double lat, double lon) async {
    try {
      final helper = NetworkHelper(
        '$reverseGeocodingURL?latitude=$lat&longitude=$lon&localityLanguage=en',
      );
      final data = await helper.getData();
      final city = data?['city'] ?? data?['locality'] ?? '';
      if (city.toString().isNotEmpty) return city;
    } catch (e) {
      debugPrint('$e');
    }
    return 'your location';
  }

  // WMO code -> icon
  String getWeatherIcon(int condition) {
    if (condition >= 95) {
      return '🌩';
    } else if (condition >= 80) {
      return '🌧';
    } else if (condition >= 71) {
      return '☃️';
    } else if (condition >= 51) {
      return '☔️';
    } else if (condition >= 45) {
      return '🌫';
    } else if (condition >= 1) {
      return '☁️';
    } else {
      return '☀️';
    }
  }

  String getMessage(int temp) {
    if (temp > 30) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
