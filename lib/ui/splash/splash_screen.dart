import 'package:assignment5_islami/ui/home/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Home.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/splash.jpg");
  }
}
