import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class GoogleMapHospital extends StatefulWidget {
  @override
  _GoogleMapHospital createState() => _GoogleMapHospital();
}

class _GoogleMapHospital extends State<GoogleMapHospital> {
  bool mapType = true;
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController googleMapController;
  String searchAddress;
  List<Marker> _markers = [];
  var location;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.033333, 31.233334),
    zoom: 14.4746,
  );
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(30.033333, 31.233334),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            GoogleMap(
              markers: Set.from(_markers),
              mapType: mapType ? MapType.normal : MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: mapCreated,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchAddress = value;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter Hospital Name...',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            iconSize: 30,
                            onPressed: searchNavigate,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          mapType = !mapType;
                        });
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.red[900],
                        child: Icon(
                          Icons.map,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.red[900],
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.red[900],
          onPressed: () async {
            Navigator.pop(context, location);
            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
          },
          label: Text('select this location'),
        ),
      ),
    );
  }

  void mapCreated(GoogleMapController controller) {
    setState(() {
      googleMapController = controller;
    });
  }

  searchNavigate() {
    Geolocator().placemarkFromAddress(searchAddress).then((result) {
      setState(() {
        location = result[0];
        _markers.add(
          Marker(
              markerId: MarkerId('1'),
              position: LatLng(
                  result[0].position.latitude, result[0].position.longitude),
              onTap: () {
                print('on tap map');
              }),
        );
      });
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
                result[0].position.latitude, result[0].position.longitude),
            zoom: 16.0,
          ),
        ),
      );
    });
  }
}
