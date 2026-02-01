import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/views/home_view.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeView()),
       (route) => mounted,);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
      child: Lottie.asset('assets/lottie/Weather (1).json'),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     // Row(
      //     //   mainAxisSize: MainAxisSize.min,
      //     //   mainAxisAlignment: MainAxisAlignment.center,
      //     //   crossAxisAlignment: CrossAxisAlignment.center,
      //     //   children: [
      //     //     Text('News', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
      //     //     Text('Cloud', style: TextStyle(color: Colors.orange, fontSize: 30, fontWeight: FontWeight.bold)),
      //     //   ],
      //     // ),
      //     // SpinKitWaveSpinner(
      //     //   color: Colors.orange,
      //     //   size: 120.0,
      //     // ),
      //     ],
      //   ),
      ),
    );
  }
}
