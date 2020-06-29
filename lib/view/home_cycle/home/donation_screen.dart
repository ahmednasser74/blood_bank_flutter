import 'package:bloodbank/view/home_cycle/home/create_donation.dart';
import 'package:bloodbank/widget/donation_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DonationScreen extends StatefulWidget {
  static const String id = 'donation_screen';

  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  List data;

  String bloodType = 'hint';

  Future<void> fetchData() async {
    String url =
        'http://ipda3-tech.com/blood-bank/api/v1/donation-requests?api_token=W4mx3VMIWetLcvEcyF554CfxjZHwdtQldbdlCl2XAaBTDIpNjKO1f7CHuwKl&page=1';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        var extractData = jsonDecode(response.body);
        data = extractData['data']['data'];
      });
    } else {
      throw Exception('failed to load donation screen data');
    }
  }

  @override
  void initState() {
    super.initState();
    this.fetchData();
  }

  String dropdownValueBloodType ='City';
  String dropdownValueCity ='BloodType';
  List bloodTypeList = [
    'o',
    'd',
    'c',
    'a',
    'b',
  ];

  List cityList = [
    'cairo',
    'giza',
    'alex',
    'aswan',
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
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Row(
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
                          hint: dropdownValueCity,
                          icon: Icon(
                            Icons.arrow_downward,
                            color: Colors.red[900],
                          ),
                          onChange: (value) {
                            setState(() {
                              dropdownValueCity = value;
                            });
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
                          list: cityList,
                          hint: dropdownValueBloodType,
                          icon: Icon(
                            Icons.arrow_downward,
                            color: Colors.red[900],
                          ),
                          onChange: (value) {
                            setState(() {
                              dropdownValueBloodType = value;
                            });
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
                      itemCount: data == null ? 0 : data.length,
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
  final List list;
  final Function onChange;
  final String hint;
  final Icon icon;
  final String value;

  CustomDropDown({this.list, this.onChange, this.hint, this.icon,this.value});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text(
        hint,
        style: TextStyle(color: Colors.red[900], fontSize: 18),
      ),
      underline: SizedBox(),
      value: null,
      icon: icon,
      iconSize: 24,
      style: TextStyle(color: Colors.red[900]),
      onChanged: onChange,
      items: list.map((value) => DropdownMenuItem<String>(
                child: Text(
                  value,
                  style: TextStyle(color: Colors.red[900],fontSize: 18),
                ),
                value: value,
              ))
          .toList(),
    );
  }
}
