import 'package:bloodbank/view/home_cycle/home/map_screen.dart';
import 'package:bloodbank/view/home_cycle/profile_screen.dart';
import 'package:bloodbank/widget/text_field_profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateDonationScreen extends StatefulWidget {
  static const String id = 'create_donation_scree';

  @override
  _CreateDonationScreenState createState() => _CreateDonationScreenState();
}

class _CreateDonationScreenState extends State<CreateDonationScreen> {
  DateTime selectedDate = DateTime.now();
  final datePickerController = TextEditingController();
  DateTime selectedDate2 = DateTime.now();
  final datePickerController2 = TextEditingController();

  String selectedItemBloodType;
  String selectedItemCity;
  String selectedItemRegion;
  String hospitalLocation = 'Hospital Location';

  List bloodTypeList = List();
  List cityList = List();
  List regionList = List();
  String bloodTypeUrl = 'http://ipda3-tech.com/blood-bank/api/v1/blood-types';
  String cityUrl = 'http://ipda3-tech.com/blood-bank/api/v1/governorates';
  String regionUrl =
      'http://ipda3-tech.com/blood-bank/api/v1/cities?governorate';

  Future<String> bloodTypeData() async {
    http.Response response = await http.get(bloodTypeUrl);
    var responseBody = jsonDecode(response.body);
    setState(() {
      bloodTypeList = responseBody['data'];
    });
  }

  Future<String> cityData() async {
    http.Response response = await http.get(cityUrl);
    var responseBody = jsonDecode(response.body);
    setState(() {
      cityList = responseBody['data'];
    });
  }

  Future<String> regionData() async {
    http.Response response = await http.get(regionUrl);
    var responseBody = jsonDecode(response.body);
    setState(() {
      regionList = responseBody['data'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.bloodTypeData();
    this.cityData();
    this.regionData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Center(child: Text('Create Donation')),
          backgroundColor: Colors.red[900],
        ),
        body: Container(
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    TextFieldProfile(
                      labelText: 'Name',
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(height: 10),
                    TextFieldProfile(
                      labelText: 'Email',
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10),
                    CustomProfileContainer(
                      spinnerWidget: DropdownButton(
                        underline: SizedBox(),
                        items: bloodTypeList.map((item) {
                          return DropdownMenuItem(
                            child: Text(item['name']),
                            value: item['id'].toString(),
                          );
                        }).toList(),
                        value: selectedItemBloodType,
                        hint: Text('Blood Type'),
                        icon: Icon(
                          Icons.arrow_downward,
                          color: Colors.transparent,
                        ),
                        onChanged: (value) {
                          setState(() {
                            selectedItemBloodType = value;
                            bloodTypeData();
                          });
                        },
                      ),
                      endIcon: Icons.arrow_downward,
                    ),
                    SizedBox(height: 10),
                    TextFieldProfile(
                      labelText: 'Bags Number',
                      textInputType: TextInputType.phone,
                    ),
                    SizedBox(height: 10),
                    CustomProfileContainer(
                      spinnerWidget: Text(
                        hospitalLocation,
                        style: TextStyle(fontSize: 16, color: Colors.red[900]),
                      ),
                      onTap: () async {
                        var location = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GoogleMapHospital(),
                          ),
                        );
                        setState(() {
                          hospitalLocation = location.name;
                        });
                      },
                      endIcon: Icons.location_on,
                    ),
                    SizedBox(height: 10),
                    CustomProfileContainer(
                      spinnerWidget: DropdownButton(
                        underline: SizedBox(),
                        items: cityList.map((item) {
                          return DropdownMenuItem(
                            child: Text(item['name']),
                            value: item['id'].toString(),
                          );
                        }).toList(),
                        value: selectedItemCity,
                        hint: Text('City'),
                        icon: SizedBox(),
                        onChanged: (value) {
                          setState(() {
                            selectedItemCity = value;
                            cityData();
                          });
                        },
                      ),
                      endIcon: Icons.arrow_downward,
                    ),
                    SizedBox(height: 10),
                    CustomProfileContainer(
                      spinnerWidget: DropdownButton(
                        underline: SizedBox(),
                        items: regionList.map((item) {
                          return DropdownMenuItem(
                            child: Text(item['name']),
                            value: item['id'].toString(),
                          );
                        }).toList(),
                        value: selectedItemRegion,
                        hint: Text('Region'),
                        icon: Icon(
                          Icons.arrow_downward,
                          color: Colors.transparent,
                        ),
                        onChanged: (value) {
                          setState(() {
                            selectedItemRegion = value;
                            regionData();
                          });
                        },
                      ),
                      endIcon: Icons.arrow_downward,
                    ),
                    SizedBox(height: 10),
                    TextFieldProfile(
                      labelText: 'Phone',
                      textInputType: TextInputType.phone,
                    ),
                    SizedBox(height: 10),
                    TextFieldProfile(
                      labelText: 'Comment',
                      textInputType: TextInputType.phone,
                      maxLines: 5,
                    ),
                    SizedBox(height: 10),
                    FlatButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Send',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      color: Colors.red[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future selectDateAndroid(BuildContext context, DateTime selectedDate,
      TextEditingController datePickerController) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        datePickerController.text = selectedDate.toString();
      });
  }
}
