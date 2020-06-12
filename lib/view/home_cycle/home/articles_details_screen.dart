import 'package:flutter/material.dart';

class ArticlesDetailsScreen extends StatefulWidget {
  static const id = 'articles_details_screen';

  final String title;
  final String networkImage;
  final IconData icon;

  ArticlesDetailsScreen({this.title, this.networkImage, this.icon});

  @override
  _ArticlesDetailsScreenState createState() => _ArticlesDetailsScreenState();
}

class _ArticlesDetailsScreenState extends State<ArticlesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Image(
              image: NetworkImage(widget.networkImage),
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              transform: Matrix4.translationValues(0.0, -20.0, 0.0),
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.red[900],
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Text(
                            widget.title,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
