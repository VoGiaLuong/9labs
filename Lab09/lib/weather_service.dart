import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class WeatherServiceException implements Exception {
  WeatherServiceException(this.message);

  final String message;

  @override
  String toString() => message;
}

class WeatherService {
  WeatherService({http.Client? client, String? apiKey})
      : _client = client ?? http.Client(),
        _apiKey = apiKey ?? dotenv.env['API_KEY']?.trim() ?? '';

  static const _apiUrl = 'https://api.openweathermap.org/data/2.5/weather';

  final http.Client _client;
  final String _apiKey;

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final trimmedCity = city.trim();
    if (trimmedCity.isEmpty) {
      throw WeatherServiceException('Enter a city name.');
    }
    if (_apiKey.isEmpty) {
      throw WeatherServiceException('Weather service is not configured.');
    }

    final uri = Uri.parse(_apiUrl).replace(
      queryParameters: {
        'q': trimmedCity,
        'appid': _apiKey,
        'units': 'metric',
      },
    );

    try {
      final response = await _client.get(uri);
      if (response.statusCode != 200) {
        throw WeatherServiceException('Unable to load weather data.');
      }

      final decoded = jsonDecode(response.body);
      if (decoded is! Map<String, dynamic>) {
        throw WeatherServiceException('Weather service returned invalid data.');
      }
      return decoded;
    } on WeatherServiceException {
      rethrow;
    } on FormatException {
      throw WeatherServiceException('Weather service returned invalid data.');
    } on http.ClientException {
      throw WeatherServiceException('Check your internet connection and try again.');
    }
  }
}
