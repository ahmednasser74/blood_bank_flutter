import 'package:bloodbank/widget/constants.dart';
import 'package:bloodbank/widget/text_field_profile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';

  static const List<String> bloodType = [
    'A',
    'A+',
    'B',
    'B+',
  ];
  static const List<String> city = [
    'giza',
    'cairo',
    'alex',
    'aswan',
  ];
  static const List<String> region = [
    'haram',
    'faisal',
    'omraneya',
    'maryotya',
  ];

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DateTime selectedDate = DateTime.now();
  final datePickerController = TextEditingController();
  DateTime selectedDate2 = DateTime.now();
  final datePickerController2 = TextEditingController();

  String selectedItemBloodType;
  String selectedItemCity;
  String selectedItemRegion;
  final List<String> bloodType = [
    'A',
    'A+',
    'B',
    'B+',
  ];
  final List<String> city = [
    'giza',
    'cairo',
    'alex',
    'aswan',
  ];
  final List<String> region = [
    'haram',
    'faisal',
    'omraneya',
    'maryotya',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Edit Profile')),
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
                      icon: Icons.person_outline,
                      labelText: 'Name',
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(height: 10),
                    TextFieldProfile(
                      icon: Icons.email,
                      labelText: 'Email',
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10),
                    CustomProfileContainer(
                      startIcon: Icons.date_range,
                      spinnerWidget: Text(
                        datePickerController.text.isEmpty
                            ? 'Birth Date'
                            : '${datePickerController.text}',
                        style: TextStyle(
                            fontSize: 16,
                            color: datePickerController.text.isEmpty
                                ? Colors.red[900]
                                : Colors.black),
                      ),
                      onTap: () {
                        _selectDateAndroid(
                            context, selectedDate, datePickerController);
                      },
                    ),
                    SizedBox(height: 10),
                    CustomProfileContainer(
                      startIcon: Icons.do_not_disturb_alt,
                      spinnerWidget: androidDropdownBloodType(),
                      endIcon: Icons.arrow_downward,
                    ),
                    SizedBox(height: 10),
                    CustomProfileContainer(
                      startIcon: Icons.date_range,
                      spinnerWidget: Text(
                        datePickerController2.text.isEmpty
                            ? 'Last Donation Date'
                            : '${datePickerController2.text}',
                        style: TextStyle(
                            fontSize: 16,
                            color: datePickerController2.text.isEmpty
                                ? Colors.red[900]
                                : Colors.black),
                      ),
                      onTap: () {
                        _selectDateAndroid(
                            context, selectedDate2, datePickerController2);
                      },
                    ),
                    SizedBox(height: 10),
                    CustomProfileContainer(
                      startIcon: Icons.home,
                      spinnerWidget: androidDropdownCity(),
                      endIcon: Icons.arrow_downward,
                    ),
                    SizedBox(height: 10),
                    CustomProfileContainer(
                      startIcon: Icons.home,
                      spinnerWidget: androidDropdownRegion(region, 'region'),
                      endIcon: Icons.arrow_downward,
                    ),
                    SizedBox(height: 10),
                    TextFieldProfile(
                      icon: Icons.phone,
                      labelText: 'Phone',
                      textInputType: TextInputType.phone,
                    ),
                    SizedBox(height: 10),
                    TextFieldProfile(
                      icon: Icons.lock,
                      labelText: 'Password',
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(height: 10),
                    TextFieldProfile(
                      icon: Icons.lock,
                      labelText: 'Password Confirmation',
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(height: 10),
                    FlatButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Edit',
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
    for (String item in bloodType) {
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
    for (String item in city) {
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

class CustomProfileContainer extends StatelessWidget {
  final Widget spinnerWidget;
  final Function onTap;
  final IconData startIcon;
  final IconData endIcon;

  CustomProfileContainer(
      {this.spinnerWidget, this.onTap, this.startIcon, this.endIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: kContainerDecorationProfileScreen,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 20),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            children: <Widget>[
              Icon(
                startIcon,
                color: Colors.red[900],
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: spinnerWidget,
              )),
              Icon(
                endIcon,
                color: Colors.red[900],
              )
            ],
          ),
        ),
      ),
    );
  }
}
