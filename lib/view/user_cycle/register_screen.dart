import 'package:bloodbank/widget/constants.dart';
import 'package:bloodbank/widget/textfield_register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final datePickerController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  double heightContainer = Platform.isIOS ? 100 : 50;

  double widthContainer = double.infinity;
  BoxDecoration boxDecorationContainer = BoxDecoration(
    color: Colors.transparent,
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );
  var extractData;

  var bloodTypeName;
  String selectedItem;
  final List<String> bloodType = [
    'A',
    'A+',
    'B',
    'B+',
  ];

//  Future<String> bloodTypeData() async {
//    String url = 'http://ipda3-tech.com/blood-bank/api/v1/blood-types';
//    http.Response response = await http.get(url);
//    extractData = jsonDecode(response.body);
//    bloodTypeName = extractData[0]['name'];
//  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'Create New Account',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFieldRegister(
                        icon: Icons.person,
                        labelText: 'Name',
//                  textEditingController: ,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(height: 10),
                      TextFieldRegister(
                        icon: Icons.email,
                        labelText: 'Email',
//                  textEditingController: ,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 10),
                      TextFieldRegister(
                        onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          Platform.isAndroid
                              ? _selectDateAndroid(context)
                              : _showModalBottomSheet(context);
                        },
                        textEditingController: datePickerController,
                        icon: Icons.date_range,
                        labelText: "Date Of Birth",
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(height: 10),
                      Container(
//                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  'images/blood_drop.png',
                                  height: 25,
                                  width: 25,
                                  color: Colors.white,
                                ),
                                Expanded(
                                  child: Platform.isAndroid
                                      ? androidDropdown()
                                      : iOSPicker(),
                                ),
                                Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white,
                                )
                              ],
                            )),
                      ),
                      SizedBox(height: 10),
                      TextFieldRegister(
                        onTap: () {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          Platform.isAndroid
                              ? _selectDateAndroid(context)
                              : _showModalBottomSheet(context);
                        },
                        textEditingController: datePickerController,
                        icon: Icons.date_range,
                        labelText: "Last Donate",
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: heightContainer,
                        decoration: boxDecorationContainer,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.home,
                                  color: Colors.white,
                                ),
                                Expanded(
                                  child: Platform.isAndroid
                                      ? androidDropdown()
                                      : iOSPicker(),
                                ),
                                Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white,
                                )
                              ],
                            )),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: heightContainer,
                        width: widthContainer,
                        decoration: boxDecorationContainer,
                        child: GestureDetector(
                          onTap: () {
                            print('row pressed');
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.home,
                                  color: Colors.white,
                                ),
                                Expanded(
                                  child: Platform.isAndroid
                                      ? androidDropdown()
                                      : iOSPicker(),
                                ),
                                Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.phone,
                        decoration: kDecorationLoginTextField.copyWith(
                            labelText: 'Phone',
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: kDecorationLoginTextField.copyWith(
                            labelText: 'Password',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: kDecorationLoginTextField.copyWith(
                            labelText: 'Password Confirmation',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(height: 10),
                      RaisedButton(
                        focusColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child:
                              Text('Register', style: TextStyle(fontSize: 16)),
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: missing_return
  Widget _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 4,
            child: Column(
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Done')),
                Expanded(child: _showCupertinoDatePicker())
              ],
            ),
          );
        });
  }

  Widget _showCupertinoDatePicker() {
    return CupertinoDatePicker(
      initialDateTime: selectedDate,
      onDateTimeChanged: (DateTime newDate) {
        selectedDate = newDate;
        print('2. onDateTimeChanged : $selectedDate');
      },
      minimumYear: 1950,
      maximumYear: 2050,
      mode: CupertinoDatePickerMode.date,
    );
  }

  Future<Null> _selectDateAndroid(BuildContext context) async {
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

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String bloodType in bloodType) {
      pickerItems.add(Text(bloodType));
    }
    return CupertinoPicker(
      backgroundColor: Colors.transparent,
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        selectedItem = bloodType[selectedIndex];
      },
      children: pickerItems,
    );
  }

//  DropdownButton<String> androidDropdown(List<String> list) {
//    List<DropdownMenuItem<String>> dropDownItems = [];
//    for (String currency in list) {
//      var newItem = DropdownMenuItem(
//        child: Text(currency),
//        value: currency,
//      );
//      list.add(newItem);
//    }
//    return DropdownButton<String>(
//        value: selectedItem,
//        items: list,
//        onChanged: (value) {
//          setState(() {
//            selectedItem = value;
//          });
//        });
//  }

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String item in bloodType) {
      var newItem = DropdownMenuItem(
        child: Text(
          item,
          style: TextStyle(color: Colors.white),
        ),
        value: item,
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
        underline: SizedBox(),
        iconEnabledColor: Colors.transparent,
        hint: Text('BloodType', style: TextStyle(color: Colors.white)),
        dropdownColor: Colors.grey[600],
        value: selectedItem,
        items: dropDownItems,
        isExpanded: true,
        onChanged: (value) {
          setState(() {
            selectedItem = value;
          });
        });
  }
}

//DatePicker.showDatePicker(context,
//showTitleActions: true,
//minTime: DateTime(2018, 3, 5),
//maxTime: DateTime.now(), onChanged: (date) {
//selectedDate = date;
//print('change $date');
//}, onConfirm: (date) {
//print('confirm $date');
//setState(() {
//selectedDate = date;
//});
//},
//currentTime: DateTime.now(),
//locale: LocaleType.en);
