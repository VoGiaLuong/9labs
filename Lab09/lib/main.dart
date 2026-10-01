import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'weather_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(const ClimaApp());
}

class ClimaApp extends StatelessWidget {
  const ClimaApp({super.key, this.weatherService});

  final WeatherService? weatherService;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima',
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      home: WeatherScreen(weatherService: weatherService),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, this.weatherService});

  final WeatherService? weatherService;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late final WeatherService _weatherService;
  final _cityController = TextEditingController(text: 'London');
  String _cityName = 'London';
  String? _temperature;
  String? _weatherDescription;
  String? _errorMessage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _weatherService = widget.weatherService ?? WeatherService();
    _getWeather();
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  Future<void> _getWeather() async {
    final city = _cityController.text.trim();
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final weatherData = await _weatherService.fetchWeather(city);
      final main = weatherData['main'];
      final weather = weatherData['weather'];
      if (main is! Map || weather is! List || weather.isEmpty || weather.first is! Map) {
        throw WeatherServiceException('Weather service returned incomplete data.');
      }
      final temperature = main['temp'];
      final description = (weather.first as Map)['description'];
      if (temperature == null || description is! String) {
        throw WeatherServiceException('Weather service returned incomplete data.');
      }
      if (!mounted) return;
      setState(() {
        _cityName = city;
        _temperature = '$temperature°C';
        _weatherDescription = description;
        _isLoading = false;
      });
    } on WeatherServiceException catch (error) {
      if (!mounted) return;
      setState(() {
        _errorMessage = error.message;
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Something went wrong. Please try again.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clima Weather')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'City: $_cityName',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            if (_isLoading) const Center(child: CircularProgressIndicator()),
            if (!_isLoading && _errorMessage != null)
              Text(
                _errorMessage!,
                key: const Key('weatherError'),
                style: TextStyle(color: Theme.of(context).colorScheme.error),
                textAlign: TextAlign.center,
              ),
            if (!_isLoading && _temperature != null) ...[
              Text('Temperature: $_temperature', style: const TextStyle(fontSize: 25)),
              Text('Condition: $_weatherDescription', style: const TextStyle(fontSize: 20)),
            ],
            const SizedBox(height: 20),
            TextField(
              controller: _cityController,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) => _getWeather(),
              decoration: const InputDecoration(
                labelText: 'Enter city name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _getWeather,
              child: const Text('Get Weather'),
            ),
          ],
        ),
      ),
    );
  }
}
