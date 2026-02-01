import 'dart:developer' show log;

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'd11e51f5af664a358ca202542252504';
  WeatherServices(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
         Response response = await dio.get(
            '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7&aqi=yes&alerts=yes',
          );
          WeatherModel weatherModel = WeatherModel.fromJson(response.data);
          return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message']?? 'opps something went wrong try again later';
      throw Exception('Failed to load weather data: $errorMessage');
    } catch (e) {
      log(e.toString());
      throw Exception('opps something went wrong try again later');
    }
  }
}
