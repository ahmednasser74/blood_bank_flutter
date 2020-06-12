import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  static const id = 'contact_us_screen';
  final InputDecoration inputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.grey[300],
    hintText: 'Message Title',
    contentPadding: EdgeInsets.all(20),
    hintStyle: TextStyle(color: Colors.deepOrange),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.grey[300])),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.grey[300])),
  );

  @override
  Widget build(BuildContext context) {
    final double imageWidth = MediaQuery.of(context).size.width / 2;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.red[900],
          title: Center(child: Text('ContactUs')),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Phone',
                    style: TextStyle(
                      color: Colors.red[900],
                      fontSize: 25,
                      fontFamily: 'shekari',
                    ),
                  ),
                  Divider(
                    color: Colors.grey[200],
                    thickness: 1,
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.phone,
                            size: 30, color: Colors.deepOrange),
                      ),
                      Text(
                        '01119193535',
                        style:
                            TextStyle(fontSize: 20, color: Colors.deepOrange),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(color: Colors.red[900], fontSize: 25),
                  ),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.mail_outline,
                            size: 30, color: Colors.deepOrange),
                      ),
                      Text(
                        'ahnasser213@gmail.com',
                        style:
                            TextStyle(fontSize: 20, color: Colors.deepOrange),
                      )
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          'images/facebook.png',
                          width: imageWidth,
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          'images/instagram.png',
                          width: imageWidth,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          'images/twitter.png',
                          width: imageWidth,
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          'images/youtube.png',
                          width: imageWidth,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: inputDecoration,
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: TextField(
                      maxLines: 8,
                      decoration: inputDecoration.copyWith(
                        hintText: "Enter your message",
                        fillColor: Colors.grey[300],
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: FlatButton(
                      color: Colors.red[900],
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'SEND',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
