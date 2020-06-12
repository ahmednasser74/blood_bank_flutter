import 'package:bloodbank/view/splash_cycle/slider_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SliderScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -30,
                    left: -30,
                    child: Image.asset("images/splash_top.png"),
                  ),
                ],
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -20.0, 0.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Image.asset("images/red_logo.png"),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Text(
                      'بنك الدم',
                      style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'shekari',
                          color: Colors.red[900]),
                    ),
                  ),
                  Positioned(
                    bottom: -30,
                    right: -30,
                    child: Image.asset("images/splash_bottom.png"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
