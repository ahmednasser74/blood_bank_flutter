import 'package:bloodbank/view/splash_cycle/slider_model.dart';
import 'package:bloodbank/view/user_cycle/login_screen.dart';
import 'package:flutter/material.dart';

class Slider1 extends StatefulWidget {
  static const id = 'slider_screen';

  @override
  _Slider1State createState() => _Slider1State();
}

class _Slider1State extends State<Slider1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SliderScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreen createState() => _SliderScreen();
}

class _SliderScreen extends State<SliderScreen> {
  List<SliderModel> mySlides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.red : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)])),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: MediaQuery.of(context).size.height - 100,
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  slideIndex = index;
                });
              },
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset('images/slide1.png'),
                    Text(
                      'welcome screen 1',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Image.asset('images/slide2.png'),
                    Text(
                      'welcome screen 2',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Image.asset('images/slide3.png'),
                    Text(
                      'welcome screen 3',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    )
                  ],
                ),
              ],
            ),
          ),
          bottomSheet: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                colors: [
                  Colors.grey[200],
                  Colors.grey[500],
                  Colors.grey[900],
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      controller.animateToPage(2,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear);
                    },
                    splashColor: Colors.blue[50],
                    child: Text(
                      "SKIP",
                      style: TextStyle(
                          color: Colors.red[900], fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        for (int i = 0; i < 3; i++)
                          i == slideIndex
                              ? buildPageIndicator(true)
                              : buildPageIndicator(false)

                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: slideIndex != 2
                        ? () {
                            print("this is slideIndex: $slideIndex");
                            controller.animateToPage(slideIndex + 1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.linear);
                          }
                        : () {
                            Navigator.pushNamed(context, LoginScreen.id);
                          },
                    splashColor: Colors.blue[50],
                    child: CircleAvatar(
                      child: slideIndex != 2
                          ? Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                      backgroundColor: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class SlideTile extends StatelessWidget {
  final String imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath),
          SizedBox(
            height: 40,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(desc,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14))
        ],
      ),
    );
  }
}
