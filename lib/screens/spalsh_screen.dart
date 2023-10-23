import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Use a Timer to navigate to the LoginScreen after 3 seconds.
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEB3738),
      body: Center(
        child: Container(
          color: Color(0xffEB3738),
          child: Center(
            child: Image.asset('assets/images/Group 155.png'),
          ),
        ),
      ),
    );
  }
}
