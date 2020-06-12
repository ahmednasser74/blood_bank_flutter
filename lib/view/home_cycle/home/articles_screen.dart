import 'package:bloodbank/widget/article_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'articles_details_screen.dart';
import 'create_donation.dart';

class ArticlesScreen extends StatefulWidget {
  static const String id = 'articles_screen';

  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  List data;
  String url =
      'http://ipda3-tech.com/blood-bank/api/v1/posts?api_token=Zz9HuAjCY4kw2Ma2XaA6x7T5O3UODws1UakXI9vgFVSoY3xUXYOarHX2VH27&page=1#';

  @override
  void initState() {
    super.initState();
    this.articlesData();
  }

  Future<void> articlesData() async {
    http.Response response = await http.get(url);
    setState(() {
      var extractData = jsonDecode(response.body);
      data = extractData['data']['data'];
    });
  }

  String dropdownValue = 'الوقاية';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.red[900],
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[300]),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search),
                          color: Colors.red[900],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Search',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintStyle: TextStyle(color: Colors.red[900])),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          underline: SizedBox(),
                          icon: Icon(
                            Icons.arrow_downward,
                            color: Colors.red[900],
                          ),
                          iconSize: 24,
                          style: TextStyle(color: Colors.red[900]),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>['الوقاية', 'خير', 'من', 'العلاج']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: data == null
                    ? Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 4,
                        ),
                      )
                    : ListView.builder(
                        itemCount: data == null ? 0 : data.length,
                        shrinkWrap: true, // use this
                        itemBuilder: (context, index) {
                          return ArticleItem(
                            onTapItem: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ArticlesDetailsScreen(
                                    title: data[index]['title'],
                                    networkImage: data[index]
                                        ['thumbnail_full_path'],
                                    icon: data[index]['is_favourite'] == false
                                        ? Icons.favorite_border
                                        : Icons.favorite,
                                  ),
                                ),
                              );
                            },
                            title: data[index]['title'],
                            networkImage: NetworkImage(
                                data[index]['thumbnail_full_path']),
                            icon: data[index]['is_favourite'] == false
                                ? Icons.favorite_border
                                : Icons.favorite,
//                            onPressedFavorite: () {
//                              bool isFavorite = data[index]['is_favourite'];
//                            },
                          );
                        }),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateDonationScreen(),
              ),
            );
          },
          label: Text('Donate'),
          icon: Icon(Icons.add),
          backgroundColor: Colors.red[900],
        ),
      ),
    );
  }
}
