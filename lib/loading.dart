import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/homepage.dart';
import 'package:weather_app/loading.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  double latitude;

  double longitude;

  getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      this.latitude = position.latitude;
      this.longitude = position.longitude;
    });
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff707277),
      body: latitude == null
          ? Container(
              child: Center(
              child: SpinKitFadingCircle(color: Colors.white, size: 50),
            ))
          : HomePage(
              latitude: latitude,
              longitude: longitude,
            ),
    );
  }
}
