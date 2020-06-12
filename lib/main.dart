import 'package:bloodbank/view/home_cycle/home/articles_details_screen.dart';
import 'package:bloodbank/view/home_cycle/home/create_donation.dart';
import 'package:bloodbank/view/home_cycle/home_screen.dart';
import 'package:bloodbank/view/home_cycle/more_setting/about_app_screen.dart';
import 'package:bloodbank/view/home_cycle/more_setting/contact_us_screen.dart';
import 'package:bloodbank/view/home_cycle/more_setting/favorite_screen.dart';
import 'package:bloodbank/view/home_cycle/more_setting/notification_setting_screen.dart';
import 'package:bloodbank/view/home_cycle/notification_screen.dart';
import 'package:bloodbank/view/home_cycle/profile_screen.dart';
import 'package:bloodbank/view/home_cycle/setting_screen.dart';
import 'package:bloodbank/view/splash_cycle/slider_screen.dart';
import 'package:bloodbank/view/splash_cycle/splash_screen.dart';
import 'package:bloodbank/view/user_cycle/login_screen.dart';
import 'package:bloodbank/view/user_cycle/register_screen.dart';
import 'package:bloodbank/widget/bottom_navigation.dart';
import 'package:flutter/material.dart';

void main()  {
//  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red[900],
        accentColor: Colors.red[900],
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        BottomNavigationScreen.id: (context) => BottomNavigationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        NotificationScreen.id: (context) => NotificationScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        SettingScreen.id: (context) => SettingScreen(),
        CreateDonationScreen.id: (context) => CreateDonationScreen(),
        FavoriteScreen.id: (context) => FavoriteScreen(),
        NotificationSettingScreen.id: (context) => NotificationSettingScreen(),
        ContactUsScreen.id: (context) => ContactUsScreen(),
        AboutAppScreen.id: (context) => AboutAppScreen(),
        ArticlesDetailsScreen.id: (context) => ArticlesDetailsScreen(),
        Slider1.id: (context) => Slider1(),
      },
    );
  }
}
