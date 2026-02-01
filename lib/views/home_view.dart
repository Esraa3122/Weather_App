import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/container_gradient.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => SearchView()));
            },
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, GetWeatherStates>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return NoWeatherBody();
          } else if (state is LoadingWeatherState) {
            return ContainerGradient(lottieAsset: 'assets/lottie/Weather.json');
          } else if (state is SuccessGetWeatherState) {
            return AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: 1,
              child: WeatherInfoBody(weatherModel: state.weatherModel),
            );
          }
          return ContainerGradient(lottieAsset: 'assets/lottie/No Data.json');
        },
      ),
    );
  }
}

// خطوات إنشاء Cubit لإدارة حالة الطقس في التطبيق:

// create states
// create cubit
// create function
// provide cubit
// integrate cubit with ui
// trigger cubit
