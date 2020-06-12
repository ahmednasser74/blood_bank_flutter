import 'package:bloodbank/view/home_cycle/more_setting/about_app_screen.dart';
import 'package:bloodbank/view/home_cycle/more_setting/contact_us_screen.dart';
import 'package:bloodbank/view/home_cycle/more_setting/favorite_screen.dart';
import 'package:bloodbank/view/home_cycle/more_setting/notification_setting_screen.dart';
import 'package:bloodbank/view/user_cycle/login_screen.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  static const String id = 'setting_screen';

  final TextStyle textStyle =
      TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold);
  RoundedRectangleBorder dialogRoundedButton = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
    side: BorderSide(color: Colors.black),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Setting')),
          backgroundColor: Colors.red[900],
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, FavoriteScreen.id);
                },
                child: CustomCardWidget(
                  title: 'Favorite',
                  icon: Icons.favorite,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ContactUsScreen.id);
                },
                child: CustomCardWidget(
                  title: 'Contact US',
                  icon: Icons.email,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AboutAppScreen.id);
                },
                child: CustomCardWidget(
                  title: 'About App',
                  icon: Icons.mobile_screen_share,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {},
                child: CustomCardWidget(
                  title: 'Rating Us',
                  icon: Icons.star,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, NotificationSettingScreen.id);
                },
                child: CustomCardWidget(
                  title: 'Setting',
                  icon: Icons.settings,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    child: AlertDialog(
                      actionsPadding: EdgeInsets.all(15),
                      shape: dialogRoundedButton,
                      backgroundColor: Colors.white,
                      title: Text('Logout ?', style: textStyle),
                      content: Text('Sure about LogOut?', style: textStyle),
                      actions: <Widget>[
                        FlatButton(
                          splashColor: Colors.red,
                          shape: dialogRoundedButton,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('No', style: textStyle),
                        ),
                        FlatButton(
                          splashColor: Colors.red,
                          shape: dialogRoundedButton,
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.id);
                          },
                          child: Text('Yes', style: textStyle),
                        ),
                      ],
                    ),
                  );
                },
                child: CustomCardWidget(
                  title: 'LogOut',
                  icon: Icons.exit_to_app,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCardWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  CustomCardWidget({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.red[900],
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: <Widget>[
              Icon(
                icon,
                size: 50,
                color: Colors.red[900],
              ),
              Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
