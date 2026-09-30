import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherService {
  final String apiUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey = dotenv.env['API_KEY']!; // Lấy API Key từ .env

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final response = await http.get(Uri.parse('$apiUrl?q=$city&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return json.decode(response.body); // Trả về dữ liệu JSON của thời tiết
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
