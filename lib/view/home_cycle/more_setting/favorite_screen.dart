import 'dart:ui';

import 'package:bloodbank/view/home_cycle/more_setting/notification_setting_screen.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  static const id = 'favorite_screen';

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with SingleTickerProviderStateMixin {
  bool isPressed = false;

  AnimationController _controller;

  Animation animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds:5),
      vsync: this,
    );

    animation = Tween(begin: -10, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _controller.forward();
  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.red[900],
          title: Center(child: Text('Favorite')),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * .25,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: isPressed,
                  child: AnimatedBuilder(
                    builder: (BuildContext context,Widget child){
                      return Transform(
                        transform: Matrix4.translationValues(animation.value *width, 0, 0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * .20,
                          decoration: boxDecorationLists,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                            child: Image.asset('images/red_logo.png'),
                          ),
                        ),
                      );
                    },
                    animation: _controller,
                  ),
                ),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPressed = !isPressed;
                      });
                    },
                    child: Container(
                      height: 40,
                      decoration: boxDecorationOrange,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: OrangeRow(
                          title: 'city',
                          icon: isPressed
                              ? Icons.indeterminate_check_box
                              : Icons.add_box,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration boxDecorationCard = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
            color: Colors.black,
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 8))
      ]);

  BoxDecoration boxDecorationOrange = BoxDecoration(
      borderRadius: BorderRadius.circular(20), color: Colors.deepOrange);

  BoxDecoration boxDecorationLists = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.black,
    boxShadow: [
      BoxShadow(color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
    ],
  );
}
