//Future<List<Post>> fetchPosts() async {
//  http.Response response = await http.get('http://ws1.metcheck.com/ENGINE/v9_0/json.asp?lat=28&lon=-15.6&lid=62228&Fc=No');
//  List responseJson = json.decode(response.body);
//  return responseJson.map((m) => new Post.fromJson(m)).toList();
//}
//
//class Post {
//  final String temperature, rain, humidity, sunrise, sunset, updateDate;
//
//  Post({
//    this.temperature,
//    this.rain,
//    this.humidity,
//    this.sunrise,
//    this.sunset,
//    this.updateDate,
//  });
//
//  factory Post.fromJson(Map<String, dynamic> json) {
//    return new Post(
//      temperature: json['metcheckData']['forecastLocation']['forecast']['temperature'].toString(),
//      rain: json['metcheckData']['forecastLocation']['forecast']['rain'].toString(),
//      humidity:json['metcheckData']['forecastLocation']['forecast']['humidity'].toString(),
//      sunrise: json['metcheckData']['forecastLocation']['forecast']['sunrise'].toString(),
//      sunset: json['metcheckData']['forecastLocation']['forecast']['sunset'].toString(),
//      updateDate: json['metcheckData']['forecastLocation']['forecast']['utcTime'].toString(),
//    );
//  }
//}






import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(Workshops());
}

class Workshops extends StatelessWidget {
  @override
  Widget build(BuildContext mycontext) {
    return MaterialApp(
        home:Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO( 52, 73, 94, 1.0),
            automaticallyImplyLeading: false, // Don't show the leading button
            title: new Text("PHP with Flutter"),
          ),

          body: PostScreen(),
        )
    );
  }
}

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Post> _postList = new List<Post>();

  Future<List<Post>> fetchPost() async {
    final response =
    await http.get('http://www.alkadhum-col.edu.iq/Teachers%20Activities/get.php');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      List<dynamic> values = new List<dynamic>();
      values = json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            _postList.add(Post.fromJson(map));
          }
        }
      }
      return _postList;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: fetchPost(),
      builder: (_, AsyncSnapshot<List<Post>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (_, index) {
            //dynamic post = snapshot.data[index];
            return (Container(
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
              child: new Card(
                elevation: 10.0,
                child: new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text(snapshot.data[index].name, style: TextStyle(fontSize: 18.0),),
                      new Text(snapshot.data[index].msg, style: TextStyle(fontSize: 18.0),),
                      new Text(snapshot.data[index].day, style: TextStyle(fontSize: 18.0),),
                      new Text(snapshot.data[index].date, style: TextStyle(fontSize: 18.0),),
                    ],
                  ),
                ),
              ),
            ));
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    fetchPost();
  }
}

class Post {
  String name;
  String msg;
  String day;
  String date;

  Post({this.name, this.msg, this.day, this.date});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        name: json['name'],
        msg: json['msg'],
        day: json['day'],
        date:json['date']
    );
  }
}



