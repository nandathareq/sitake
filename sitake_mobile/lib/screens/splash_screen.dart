import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sitake_mobile/screens/login_screen.dart';
import 'package:sitake_mobile/utils/constants.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String message = "cek koneksi internet....";

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });

    super.initState();
  }

  bool checkConnection() {
    // cek koneksi ke server
    return true;
  }

  bool isTokenValid() {
    // cek token masih valid
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(height: 200, image: Image.asset(logo).image),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                child: LottieBuilder.asset(loading),
              ),
              Text(
                message,
                style: const TextStyle(height: 12, color: Colors.black26),
              )
            ],
          )
        ],
      ),
    );
  }
}
