# Lab09 Weather App

A Flutter weather app that retrieves the current conditions for a city.

## Setup

1. Obtain an API key from OpenWeather.
2. Copy `.env.example` to `.env`.
3. Replace the placeholder value in `.env` with your API key.

Never commit `.env`; it is ignored by Git. The app does not display the API key.

## Install dependencies

```bash
flutter pub get
```

## Run on Chrome

```bash
flutter run -d chrome
```

Enter a city name and select **Get Weather**. The app shows safe, user-facing messages for missing configuration, empty cities, network failures, and invalid responses.

## Quality checks

```bash
flutter analyze
flutter test
flutter build web
```
