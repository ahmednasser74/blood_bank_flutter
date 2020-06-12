import 'package:bloodbank/view/home_cycle/home/create_donation.dart';
import 'package:bloodbank/widget/donation_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Photo {
  final String title;
  final String thumbnailUrl;

  Photo(this.title, this.thumbnailUrl);

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(json["title"], json["thumbnailUrl"]);
  }

  static List<Photo> parseList(List<dynamic> list) {
    return list.map((i) => Photo.fromJson(i)).toList();
  }
}

class DonationScreen extends StatefulWidget {
  static const String id = 'donation_screen';

  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  List data;
  ScrollController _scrollController = ScrollController();
  int _pageNumber;
  String bloodType = 'hint';

  Future<void> fetchPhotos() async {
//    try {
    String url =
        'http://ipda3-tech.com/blood-bank/api/v1/donation-requests?api_token=W4mx3VMIWetLcvEcyF554CfxjZHwdtQldbdlCl2XAaBTDIpNjKO1f7CHuwKl&page=$_pageNumber';
    http.Response response = await http.get(url);
    var extractData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        data = extractData['data']['data'];
      });
    } else {
      throw Exception('failed to load donation screen data');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  String dropdownValue = 'الوقاية';
  List bloodTypeList = [
    'o',
    'd',
    'c',
    'a',
    'b',
  ];

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.red[900],
      ),
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[300],
                      ),
                      child: Center(
                        child: CustomDropDown(
                          list: bloodTypeList,
                          hint: dropdownValue,
                          onChange: (value) {
                            dropdownValue = value;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[300],
                      ),
                      child: Center(
                        child: CustomDropDown(
                          list: bloodTypeList,
                          hint: 'hint',
                          onChange: (value) {
                            dropdownValue = value;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: data == null
                  ? Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true, // use this
                      itemBuilder: (context, index) {
                        return DonationItem(
                          phoneNumber: data[index]['client']['phone'],
                          bloodType: data[index]['blood_type']['name'],
                          city: data[index]['city']['name'],
                          hospital: data[index]['hospital_name'],
                          name: data[index]['client']['name'],
                        );
                      }),
            )
          ],
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
          label: Text(
            'Donate',
            style: TextStyle(color: Colors.red[900]),
          ),
          icon: Icon(
            Icons.add,
            color: Colors.red[900],
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

class CustomDropDown extends StatelessWidget {
  final List<String> list;
  final Function onChange;
  final String hint;
  final Icon icon;

  CustomDropDown({this.list, this.onChange, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: null,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: SizedBox(),
      onChanged: onChange,
      items: list
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
