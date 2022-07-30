import 'package:dexplatassesment/approutes.dart';
import 'package:dexplatassesment/configs/configs.dart';
import 'package:flutter/material.dart';
import '../configs/app.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void _nextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, AppRoutes.login);
    });
  }

  @override
  void initState() {
    _nextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      body: Center(
        child: Text(
          'P O K E D E X',
          style: AppText.h1b!.copyWith(color: Colors.blue, fontSize: 50),
        ),
      ),
    );
  }
}
