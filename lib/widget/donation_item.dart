import 'package:flutter/material.dart';
import 'package:bloodbank/view/home_cycle/more_setting/favorite_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';

class DonationItem extends StatelessWidget {
  final String phoneNumber;
  final String name;
  final String hospital;
  final String city;
  final String bloodType;

  DonationItem(
      {this.phoneNumber, this.name, this.hospital, this.city, this.bloodType});

  final TextStyle textStyle = TextStyle(
    color: Colors.red[900],
    fontSize: 16,
  );
  final BoxDecoration boxDecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.7),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 8), // changes position of shadow
      ),
    ],
    color: Colors.white,
    borderRadius: BorderRadius.circular(80),
  );

  Future<void> _makePhoneCall(String phone) async {
    if (await canLaunch(phone)) {
      await launch(phone);
    } else {
      throw 'Could not launch $phone';
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = (MediaQuery.of(context).size.width) * .32;
    return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: boxDecoration,
            height: height,
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red[900],
                  radius: 65,
                  child: Text(
                    bloodType,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Name :$name',
                        style: textStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text('Hospital :$hospital', style: textStyle),
                      ),
                      Text('City :$city', style: textStyle),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        secondaryActions: <Widget>[
          Container(
            child: GestureDetector(
              onTap: () async {
                await _makePhoneCall('tel:$phoneNumber');
              },
              child: CircleAvatar(
                child: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                backgroundColor: Colors.deepOrange,
              ),
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return FavoriteScreen();
                    },
                  ),
                );
              },
              child: CircleAvatar(
                child: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
                backgroundColor: Colors.red[900],
              ),
            ),
          ),
        ]);
  }
}
