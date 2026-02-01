import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class ContainerGradient extends StatelessWidget {
  const ContainerGradient({super.key, required this.lottieAsset});

  final String lottieAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(
                      context,
                    ).weatherModel?.weatherCondition,
                  ),
                  getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(
                      context,
                    ).weatherModel?.weatherCondition,
                  )[300]!,
                  getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(
                      context,
                    ).weatherModel?.weatherCondition,
                  )[50]!,
                ],
              ),
            ),
            child: Center(child: Lottie.asset(lottieAsset)),
          );
  }
}