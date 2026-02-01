import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/glass_container.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getThemeColor(weatherModel.weatherCondition),
            getThemeColor(weatherModel.weatherCondition)[300]!,
            getThemeColor(weatherModel.weatherCondition)[50]!,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// City
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.8),
              ),
            ),

            const SizedBox(height: 24),

            /// MAIN GLASS CARD
            GlassContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    'https:${weatherModel.image!}',
                    width: 80,
                  ),
                  Text(
                    '${weatherModel.temp.round()}°',
                    style: const TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _tempText(
                          'Max', weatherModel.maxTemp.round()),
                      _tempText(
                          'Min', weatherModel.minTemp.round()),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tempText(String label, int value) {
    return Text(
      '$label: $value°',
      style: TextStyle(
        fontSize: 16,
        color: Colors.white.withOpacity(0.85),
      ),
    );
  }
}


// class WeatherInfoBody extends StatelessWidget {
//   const WeatherInfoBody({super.key, required this.weatherModel});
//   final WeatherModel weatherModel;

//   @override
//   Widget build(BuildContext context) {
//     // var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
//     // بستخدم الطريقه دى لما يكون عندى ال tree متشعبه 
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             getThemeColor(weatherModel.weatherCondition),
//             getThemeColor(weatherModel.weatherCondition)[300]!,
//             getThemeColor(weatherModel.weatherCondition)[50]!,
//           ],
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               weatherModel.cityName,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
//             ),
//             Text(
//               'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
//               style: TextStyle(fontSize: 24),
//             ),
//             const SizedBox(height: 32),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Image.network('https:${weatherModel.image!}'),
//                 Text(
//                   weatherModel.temp.toString(),
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       'Maxtemp: ${weatherModel.maxTemp.round()}',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     Text(
//                       'Mintemp: ${weatherModel.minTemp.round()}',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 32),
//             Text(
//               weatherModel.weatherCondition,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// DateTime stringToDateTime(String value) {
//   return DateTime.parse(value);
// }
