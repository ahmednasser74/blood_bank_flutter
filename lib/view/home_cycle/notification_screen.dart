import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const String id = 'notification_Screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('Notification')),backgroundColor: Colors.red[900],),
        body: Center(child: Text('notification screen')),
      ),
    );  }
}
