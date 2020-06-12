import 'package:bloodbank/view/home_cycle/home/map_screen.dart';
import 'package:bloodbank/view/home_cycle/profile_screen.dart';
import 'package:bloodbank/widget/text_field_profile.dart';
import 'package:flutter/material.dart';

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
                      spinnerWidget: androidDropdownBloodType(),
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
                        print('location ====${location.position.latitude}');
                        setState(() {
                          hospitalLocation = location.name;
                        });
                      },
                      endIcon: Icons.location_on,
                    ),
                    SizedBox(height: 10),
                    CustomProfileContainer(
                      spinnerWidget: androidDropdownCity(),
                      endIcon: Icons.arrow_downward,
                    ),
                    SizedBox(height: 10),
                    CustomProfileContainer(
                      spinnerWidget:
                          androidDropdownRegion(ProfileScreen.region, 'region'),
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

  Future<Null> _selectDateAndroid(BuildContext context, DateTime selectedDate,
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

  DropdownButton<String> androidDropdownBloodType() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String item in ProfileScreen.bloodType) {
      var newItem = DropdownMenuItem(
        child: Text(
          item,
          style: TextStyle(color: Colors.red[900]),
        ),
        value: item,
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
        underline: SizedBox(),
        iconEnabledColor: Colors.transparent,
        hint: Text('BloodType', style: TextStyle(color: Colors.red[900])),
        dropdownColor: Colors.grey[300],
        value: selectedItemBloodType,
        items: dropDownItems,
        isExpanded: true,
        onChanged: (value) {
          setState(() {
            selectedItemBloodType = value;
          });
        });
  }

  DropdownButton<String> androidDropdownCity() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String item in ProfileScreen.city) {
      var newItem = DropdownMenuItem(
        child: Text(
          item,
          style: TextStyle(color: Colors.red[900]),
        ),
        value: item,
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
        underline: SizedBox(),
        iconEnabledColor: Colors.transparent,
        hint: Text('City', style: TextStyle(color: Colors.red[900])),
        dropdownColor: Colors.grey[300],
        value: selectedItemCity,
        items: dropDownItems,
        isExpanded: true,
        onChanged: (value) {
          setState(() {
            selectedItemCity = value;
          });
        });
  }

  DropdownButton<String> androidDropdownRegion(List<String> list, String hint) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String item in list) {
      var newItem = DropdownMenuItem(
        child: Text(
          item,
          style: TextStyle(color: Colors.red[900]),
        ),
        value: item,
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
        underline: SizedBox(),
        iconEnabledColor: Colors.transparent,
        hint: Text(hint, style: TextStyle(color: Colors.red[900])),
        dropdownColor: Colors.grey[300],
        value: selectedItemRegion,
        items: dropDownItems,
        isExpanded: true,
        onChanged: (value) {
          setState(() {
            selectedItemRegion = value;
          });
        });
  }
}
