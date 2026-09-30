// lib/main.dart
import 'package:flutter/material.dart';
import 'weather_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();  // Load file .env
  runApp(ClimaApp());
}

class ClimaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => Banner(
        message: 'VoGiaLuong',
        location: BannerLocation.bottomEnd,
        child: child ?? const SizedBox.shrink(),
      ),
      title: 'Clima',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  String _cityName = 'London'; // Thành phố mặc định
  String _temperature = '';
  String _weatherDescription = '';
  bool _isLoading = true;  // Thêm biến trạng thái để kiểm tra xem dữ liệu đang được tải

  void _getWeather() async {
    try {
      var weatherData = await _weatherService.fetchWeather(_cityName);
      setState(() {
        _temperature = '${weatherData['main']['temp']}°C';
        _weatherDescription = weatherData['weather'][0]['description'];
        _isLoading = false;  // Dữ liệu đã được tải, không cần hiển thị loading nữa
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getWeather();  // Lấy dữ liệu thời tiết khi màn hình được tạo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dotenv.env['API_KEY'] ?? 'API Key not found'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(
              'City: $_cityName',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              'Temperature: $_temperature',
              style: TextStyle(fontSize: 25.0),
            ),
            Text(
              'Condition: $_weatherDescription',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  _cityName = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _getWeather,
              child: Text('Get Weather'),
            ),
          ],
        ),
      ),
    );
  }
}
