import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Search City')),
      body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getThemeColor( BlocProvider.of<GetWeatherCubit>(
                        context,
                      ).weatherModel?.weatherCondition),
            getThemeColor( BlocProvider.of<GetWeatherCubit>(
                        context,
                      ).weatherModel?.weatherCondition)[300]!,
            getThemeColor( BlocProvider.of<GetWeatherCubit>(
                        context,
                      ).weatherModel?.weatherCondition)[50]!,
          ],
        ),
      ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: TextField(
              // بتتغير بمجرد لما المستخدم يكتب جوا ال textfield كل حرف
              // onChanged: (value) {
              // },
              // بتتغير لما المستخدم يضغط انتر او يخلص الكتابة
              onSubmitted: (value) {
                var getWeatherCubit =
                    BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 16,
                ),
                label: const Text('Search'),
                hint: const Text('Enter city name'),
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ), // => بتعرض ايقون فى اخر ال textfield
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
