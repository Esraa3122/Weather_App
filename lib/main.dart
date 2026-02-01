import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/splash_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, GetWeatherStates>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Weather App',
                theme: ThemeData(
                  primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(
                      context,
                    ).weatherModel?.weatherCondition,
                  ),
                  appBarTheme: AppBarTheme(
                    color: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(
                        context,
                      ).weatherModel?.weatherCondition,
                    ),
                  ),
                ),
                home: SplashPage(),
              );
            },
          );
        },
      ),
    );
  }
}
 MaterialColor getThemeColor(String? condition) {
    switch (condition?.toLowerCase()) {
      
      case 'sunny':
        return Colors.amber;

      case 'partly cloudy':
      case 'cloudy':
      case 'overcast':
        return Colors.grey;

      case 'mist':
      case 'fog':
      case 'freezing fog':
      case 'patchy rain nearby':
      case 'patchy rain possible':
      case 'patchy light rain':
      case 'light rain':
      case 'moderate rain at times':
      case 'moderate rain':
      case 'heavy rain at times':
      case 'heavy rain':
      case 'light rain shower':
      case 'moderate or heavy rain shower':
      case 'torrential rain shower':
      case 'patchy light drizzle':
      case 'light drizzle':
      case 'freezing drizzle':
      case 'heavy freezing drizzle':
      case 'light freezing rain':
      case 'moderate or heavy freezing rain':
        return Colors.blueGrey;
      case 'clear':
        return Colors.blue;

      case 'thundery outbreaks possible':
      case 'patchy light rain with thunder':
      case 'moderate or heavy rain with thunder':
        return Colors.deepPurple;

      case 'patchy snow possible':
      case 'patchy light snow':
      case 'light snow':
      case 'patchy moderate snow':
      case 'moderate snow':
      case 'patchy heavy snow':
      case 'heavy snow':
      case 'blowing snow':
      case 'blizzard':
      case 'patchy sleet possible':
      case 'light sleet':
      case 'moderate or heavy sleet':
      case 'light sleet showers':
      case 'moderate or heavy sleet showers':
      case 'ice pellets':
      case 'light showers of ice pellets':
      case 'moderate or heavy showers of ice pellets':
      case 'patchy light snow with thunder':
      case 'moderate or heavy snow with thunder':
        return Colors.lightBlue;

      default:
        return Colors.blue;
    }
  }
