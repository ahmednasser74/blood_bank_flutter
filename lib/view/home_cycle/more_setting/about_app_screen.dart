import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  static const id = 'about_app_screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.red[900],
          title: Center(child: Text('AboutApp')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Text(
                  'This page to show App content',
                  style: TextStyle(
                      color: Colors.red[900],
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'shekari'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
