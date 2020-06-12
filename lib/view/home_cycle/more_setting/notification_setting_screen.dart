import 'package:flutter/material.dart';

class NotificationSettingScreen extends StatefulWidget {
  static const id = 'notification_setting_screen';

  @override
  _NotificationSettingScreenState createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  BoxDecoration boxDecorationCard = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
            color: Colors.grey,
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 8))
      ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.red[900],
          title: Center(child: Text('NotificationSetting')),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * .20,
                    width: double.infinity,
                    decoration: boxDecorationCard,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'This is notification setting screen',
                        style: TextStyle(
                            color: Colors.red[900],
                            fontSize: 25,
                            fontFamily: 'shekari'),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  CustomListContainer(
                    orangeRowTitle: 'Blood Type',
                    containerListView: Container(
                      child: ListView.builder(itemBuilder: (context, index) {
                        return Text('gaaag');
                      }),
                    ),
                  ),
                  CustomListContainer(
                    orangeRowTitle: 'City',
                    containerListView: Container(
                      child: ListView.builder(itemBuilder: (context, index) {
                        return GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          childAspectRatio: 2.0,
                          children: List.generate(6, (index) {
                            return Center(
                              child: Checkbox(
                                activeColor: Colors.red,
                                value: true, onChanged: (bool value) {

                              },
                              ),
                            );
                          }),
                        );
                      }),
                    ),
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.deepOrange,
                    onPressed: () {
                      // on pressed save button
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'SAVE',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomListContainer extends StatefulWidget {
  final Container containerListView;
  final String orangeRowTitle;

  CustomListContainer({this.containerListView, this.orangeRowTitle});

  @override
  _CustomListContainerState createState() => _CustomListContainerState();
}

class _CustomListContainerState extends State<CustomListContainer> {
  bool isPressed = false;

  BoxDecoration boxDecorationOrange = BoxDecoration(
      borderRadius: BorderRadius.circular(20), color: Colors.deepOrange);

  BoxDecoration boxDecorationLists = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.grey[200],
    boxShadow: [
      BoxShadow(color: Colors.grey, offset: Offset(0, 10), blurRadius: 10),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .25,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: isPressed ? 1 : 0,
              child: Visibility(
                visible: isPressed,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .20,
                  decoration: boxDecorationLists,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                    child: widget.containerListView,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isPressed = !isPressed;
                  });
                },
                child: Container(
                  height: 40,
                  decoration: boxDecorationOrange,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: OrangeRow(
                      title: widget.orangeRowTitle,
                      icon: isPressed
                          ? Icons.indeterminate_check_box
                          : Icons.add_box,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrangeRow extends StatelessWidget {
  final String title;
  final IconData icon;

  OrangeRow({this.title,  this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(
              color: Colors.white, fontFamily: 'shekari', fontSize: 18),
        )
      ],
    );
  }
}
