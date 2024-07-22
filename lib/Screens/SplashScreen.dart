import 'dart:async';

import 'package:flutter/material.dart';

import 'LoginMobile.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginMobile())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Column(
        children: [
          Center(child: Image.asset('assets/images/splash.png',width: 200,height: 700,)),
          const CircularProgressIndicator(
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}