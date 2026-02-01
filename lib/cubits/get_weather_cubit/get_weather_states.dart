import 'package:weather_app/models/weather_model.dart';

class GetWeatherStates {}
class NoWeatherState extends GetWeatherStates {}
class LoadingWeatherState extends GetWeatherStates {}
class SuccessGetWeatherState extends GetWeatherStates {
  final WeatherModel weatherModel;
  SuccessGetWeatherState(this.weatherModel);
}
class FailureWeatherState extends GetWeatherStates {
  final String errorMessage;
  FailureWeatherState(this.errorMessage);
}