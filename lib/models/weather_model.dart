class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;
  WeatherModel({
    required this.cityName,
    required this.date,
    this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      // tempF: json['forecast']['forecastday'][0]['day']['avgtemp_f'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      // maxTempF: json['forecast']['forecastday'][0]['day']['maxtemp_f'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      // minTempF: json['forecast']['forecastday'][0]['day']['mintemp_f'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      
    );
  }
}


/* "humidity ==> الرطوبة

"pressure_mb": 1020, ==. الضغط بالميليبار

"uv": 0, == مؤشر الأشعة فوق البنفسجية
  
  "air_quality": {
"co": 707.85,
"no2": 67.35,
"o3": 1,
"so2": 168.95,
"pm2_5": 82.55,
"pm10": 174.75,
"us-epa-index": 4,
"gb-defra-index": 10
}

"daily_will_it_rain": 0,
"daily_chance_of_rain": 0,
"daily_will_it_snow": 0,
"daily_chance_of_snow": 0,


*/