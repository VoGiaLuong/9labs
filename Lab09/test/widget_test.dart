import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab09_vogialuong/main.dart';
import 'package:lab09_vogialuong/weather_service.dart';

void main() {
  testWidgets('shows a safe configuration error when no API key is available',
      (tester) async {
    await tester.pumpWidget(
      ClimaApp(weatherService: WeatherService(apiKey: '')),
    );

    await tester.pumpAndSettle();

    expect(find.text('Clima Weather'), findsOneWidget);
    expect(find.byKey(const Key('weatherError')), findsOneWidget);
    expect(find.text('Weather service is not configured.'), findsOneWidget);
    expect(find.textContaining('API_KEY'), findsNothing);
  });

  testWidgets('validates an empty city before making a request', (tester) async {
    await tester.pumpWidget(
      ClimaApp(weatherService: WeatherService(apiKey: 'test-key')),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), '   ');
    await tester.tap(find.text('Get Weather'));
    await tester.pumpAndSettle();

    expect(find.text('Enter a city name.'), findsOneWidget);
  });
}
