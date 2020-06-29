import 'package:bloodbank/controllers/login_data.dart';
import 'package:bloodbank/view/user_cycle/register_screen.dart';
import 'package:bloodbank/widget/bottom_navigation.dart';
import 'package:bloodbank/widget/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  LoginData databaseHelper = LoginData();
  String msgStatus = '';

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: MaterialApp(
        theme: ThemeData(
            accentColor: Colors.red[900], primaryColor: Colors.red[900]),
        home: SafeArea(
          child: Scaffold(
            body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/background.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(70, 30, 70, 5),
                            child: Image.asset("images/white_logo.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                TextField(
                                  style: TextStyle(color: Colors.white),
                                  controller: _email,
                                  keyboardType: TextInputType.phone,
                                  decoration:
                                      kDecorationLoginTextField.copyWith(
                                    labelText: 'Enter Email',
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  style: TextStyle(color: Colors.white),
                                  obscureText: true,
                                  controller: _password,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration:
                                      kDecorationLoginTextField.copyWith(
                                          labelText: 'Enter Password',
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: Colors.white,
                                          )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RaisedButton(
                                  focusColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.black)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      showSpinner = true;
                                    });
                                    setState(() {
                                      if (_email.text
                                              .trim()
                                              .toLowerCase()
                                              .isNotEmpty &&
                                          _password.text.trim().isNotEmpty) {
                                        databaseHelper.loginData(
                                            _email.text.trim().toLowerCase(),
                                            _password.text.trim());
                                        if (databaseHelper.status ==
                                            'بيانات الدخول غير صحيحة') {
                                          msgStatus = 'check mail and pw';
                                        } else {
                                          msgStatus = 'login done';
                                          //replacement
                                          Navigator.pushNamed(context,
                                              BottomNavigationScreen.id);
                                          setState(() {
                                            showSpinner = false;
                                          });
                                        }
                                      }
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      "images/warning.svg",
                                      height: 20.0,
                                      width: 20.0,
                                    ),
                                    Text('Forget Password',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                Text(msgStatus,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ButtonTheme(
                      minWidth: double.infinity,
                      height: MediaQuery.of(context).size.height * .06,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30)),
                        ),
                        color: Colors.grey,
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterScreen.id);
                        },
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

//                child: ListView(
//                  scrollDirection: Axis.vertical,
//                  shrinkWrap: true,
//                  children: <Widget>[
//                    Expanded(
//                      flex: 2,
//                      child: Image.asset("images/red_logo.png"),
//                    ),
//                    Expanded(
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          TextField(
//                            style: TextStyle(color: Colors.white),
//                            controller: _email,
//                            keyboardType: TextInputType.phone,
//                            decoration: kDecorationTextField.copyWith(
//                                labelText: 'Enter Email',
//                                prefixIcon: Icon(
//                                  Icons.email,
//                                  color: Colors.white,
//                                )),
//                          ),
//                          SizedBox(
//                            height: 20,
//                          ),
//                          TextField(
//                            style: TextStyle(color: Colors.white),
//                            obscureText: true,
//                            controller: _password,
//                            keyboardType: TextInputType.visiblePassword,
//                            decoration: kDecorationTextField.copyWith(
//                                labelText: 'Enter Password',
//                                prefixIcon: Icon(
//                                  Icons.lock,
//                                  color: Colors.white,
//                                )),
//                          ),
//                          SizedBox(
//                            height: 10,
//                          ),
//                          RaisedButton(
//                            focusColor: Colors.green,
//                            shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.circular(10.0),
//                                side: BorderSide(color: Colors.black)),
//                            child: Text(
//                              'Login',
//                              style: TextStyle(
//                                  fontSize: 16,
//                                  fontWeight: FontWeight.bold,
//                                  color: Colors.black),
//                            ),
//                            color: Colors.white,
//                            onPressed: () {
//                              setState(() {
//                                print('pressed');
//                                if (_email.text
//                                        .trim()
//                                        .toLowerCase()
//                                        .isNotEmpty &&
//                                    _password.text.trim().isNotEmpty) {
//                                  databaseHelper.loginData(
//                                      _email.text.trim().toLowerCase(),
//                                      _password.text.trim());
//                                  if (databaseHelper.status ==
//                                      'بيانات الدخول غير صحيحة') {
//                                    msgStatus = 'check mail and pw';
//                                  } else {
//                                    msgStatus = 'login done';
//                                    Navigator.pushNamed(
//                                        context, BottomNavigationScreen.id);
//                                  }
//                                }
//                              });
//                            },
//                          ),
//                          SizedBox(
//                            height: 20,
//                          ),
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: <Widget>[
//                              SvgPicture.asset("images/warning.svg",
//                                height: 20.0, width: 20.0,),
//                              Text('Forget Password',
//                                  style: TextStyle(
//                                      color: Colors.white,
//                                      fontWeight: FontWeight.bold))
//                            ],
//                          ),
//
//                          Text(msgStatus,
//                              textAlign: TextAlign.center,
//                              style: TextStyle(
//                                  fontSize: 20,
//                                  fontWeight: FontWeight.bold,
//                                  color: Colors.white)),
//                        ],
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(top: 80),
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.stretch,
//                        children: <Widget>[
//                          FlatButton(
//                            shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.circular(14.0),
//                              side: BorderSide(
//                                color: Colors.black,
//                              ),
//                            ),
//                            color: Colors.grey,
//                            child: Text(
//                              'Register',
//                              style: TextStyle(
//                                  color: Colors.white, fontSize: 16),
//                            ),
//                            onPressed: () {
//                              Navigator.pushNamed(
//                                  context, RegisterScreen.id);
//                            },
//                          ),
//                        ],
//                      ),
//                    ),
//                  ],
//                ),
