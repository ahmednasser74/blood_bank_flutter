import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}


/**
 * class ely ta7t dada 3shan change background of tabBar lama aslect tab menha
 * */
//
//void main(){
//  runApp(new MaterialApp(home:new MyApp(),
//  ));
//}
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => new _MyAppState();
//}
//class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
//  final List<MyTabs> _tabs = [
//    new MyTabs(title: "Teal", color: Colors.teal[200]),
//    new MyTabs(title: "Orange", color: Colors.orange[200])
//  ];
//
//  MyTabs _myHandler;
//
//  TabController _controller;
//
//  void initState() {
//    super.initState();
//    _controller = new TabController(length: 2, vsync: this);
//    _myHandler = _tabs[0];
//    _controller.addListener(_handleSelected);
//  }
//
//  void _handleSelected() {
//    setState(() {
//      _myHandler = _tabs[_controller.index];
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text(_myHandler.title),
//        backgroundColor: _myHandler.color,
//        bottom: new TabBar(
//          controller: _controller,
//          tabs: <Tab>[
//            new Tab(
//              text: _tabs[0].title,
//            ),
//            new Tab(
//              text: _tabs[1].title,
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//class MyTabs {
//  final String title;
//  final Color color;
//
//  MyTabs({this.title, this.color});
//}
