import 'package:bloodbank/view/home_cycle/home/articles_screen.dart';
import 'package:bloodbank/view/home_cycle/home/donation_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {

    List<MyTabs> myTabs = [
      MyTabs(title: 'Articles', icon: Icon(Icons.filter_list)),
      MyTabs(title: 'Donation', icon: Icon(Icons.home)),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red[900],
        accentColor: Colors.black,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Home')),
            bottom: TabBar(
              indicatorWeight: 2,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              tabs: <Tab>[
                new Tab(
                  text: myTabs[0].title,
                  icon: myTabs[0].icon,
                ),
                new Tab(
                  text: myTabs[1].title,
                  icon: myTabs[1].icon,
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [ArticlesScreen(), DonationScreen()],
          ),
        ),
      ),
    );
  }
}

class MyTabs {
  final String title;
  final Icon icon;

  MyTabs({this.title, this.icon});
}
