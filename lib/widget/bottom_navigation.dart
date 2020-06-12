import 'package:bloodbank/view/home_cycle/home_screen.dart';
import 'file:///C:/Users/Naser/bloodbank/lib/view/home_cycle/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloodbank/view/home_cycle/notification_screen.dart';
import 'package:bloodbank/view/home_cycle/profile_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavigationScreen extends StatefulWidget {
  static const String id = 'bottom_navigation_screen';

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    ProfileScreen(),
    NotificationScreen(),
    SettingScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 50,
        color: Colors.red[900],
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.red[900],
        animationDuration: Duration(milliseconds: 500),
        animationCurve: Curves.easeInOut,
        items: <Widget>[
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
          Icon(Icons.notification_important, color: Colors.white),
          Icon(Icons.settings, color: Colors.white),
        ],
        onTap:onTabTapped,
      ),
      body: _children[_currentIndex],
    );
  }
}








