import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_icons/flutter_icons.dart';
import './contact.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  final double latitude;
  final double longitude;
  HomePage({this.latitude, this.longitude});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map weatherData;
  getData() async {
    //in the place of {your_apiID_here} in url below...add your own registered API Key from openweathermap.org
    http.Response response = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?lat=${widget.latitude}&lon=${widget.longitude}&units=metric&appid={your_apiID_here}");
    setState(() {
      weatherData = json.decode(response.body);
    });
  }

  IconData getIcon() {
    if (weatherData["weather"][0]["id"] > 190 &&
        weatherData["weather"][0]["id"] < 240) {
      return FontAwesome.bolt;
    }
    if (weatherData["weather"][0]["id"] > 290 &&
        weatherData["weather"][0]["id"] < 340) {
      return FontAwesome5Solid.cloud_rain;
    }
    if (weatherData["weather"][0]["id"] > 490 &&
        weatherData["weather"][0]["id"] < 540) {
      return FontAwesome5Solid.cloud_showers_heavy;
    }
    if (weatherData["weather"][0]["id"] > 590 &&
        weatherData["weather"][0]["id"] < 640) {
      return FontAwesome.snowflake_o;
    }
    if (weatherData["weather"][0]["id"] > 700 &&
        weatherData["weather"][0]["id"] < 790) {
      return FontAwesome5Solid.smog;
    }
    if (weatherData["weather"][0]["id"] == 800) {
      return FontAwesome5Solid.sun;
    }
    if (weatherData["weather"][0]["id"] > 800 &&
        weatherData["weather"][0]["id"] < 810) {
      return FontAwesome5Solid.cloud_sun;
    }
  }

  String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('HH:mm a');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + ' DAY AGO';
      } else {
        time = diff.inDays.toString() + ' DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
      } else {
        time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
      }
    }

    return time;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CLI-MATE",
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff707277),
        elevation: 0.0,
      ),
      body: weatherData == null
          ? Container(
              child: Center(
              child: SpinKitFadingCircle(color: Colors.white, size: 50),
            ))
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  FittedBox(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          FontAwesome5Solid.map_marker_alt,
                          color: Color(0xff707277),
                          size: 50,
                        ),
                        Text(weatherData["name"],
                            style: TextStyle(
                                color: Color(0xff707277),
                                fontSize: 50,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(height: 100),
                  Icon(
                    getIcon(),
                    size: 80,
                    color: Color(0xff707277),
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        weatherData["main"]["temp"].toString(),
                        style:
                            TextStyle(fontSize: 120, color: Color(0xff707277)),
                      ),
                      Text(
                        "°C",
                        style:
                            TextStyle(fontSize: 50, color: Color(0xff707277)),
                      ),
                    ],
                  ),
                  Text(
                    weatherData["weather"][0]["description"],
                    style: TextStyle(fontSize: 30, color: Color(0xff707277)),
                  ),
                  Text(
                    "Feels like: ${weatherData["main"]["feels_like"]}°C",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff707277),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: <Widget>[
                      Tile(
                        text: "SUNRISE",
                        value: readTimestamp(weatherData["sys"]["sunrise"]),
                        icon: FontAwesome5Solid.sun,
                      ),
                      Tile(
                        text: "SUNSET",
                        value: readTimestamp(weatherData["sys"]["sunset"]),
                        icon: FontAwesome5.sun,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Tile(
                        text: "PRESSURE",
                        value:
                            "${weatherData["main"]["pressure"]} hPa".toString(),
                        icon: FontAwesome5Solid.thermometer_three_quarters,
                      ),
                      Tile(
                          text: "HUMIDITY",
                          value:
                              "${weatherData["main"]["humidity"]} %".toString(),
                          icon: FontAwesome5Solid.tint),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Tile(
                          text: "VISIBILITY",
                          value: "${weatherData["visibility"].toString()} m",
                          icon: FontAwesome5Solid.eye),
                      Tile(
                          text: "WIND SPEED",
                          value:
                              "${weatherData["wind"]["speed"].toStringAsFixed(1)} m/s",
                          icon: FontAwesome5Solid.wind),
                    ],
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Contact();
                      }));
                    },
                    child: Container(
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0x4d707277),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("CONTACT DEVELOPER",
                              style: TextStyle(
                                fontSize: 30,
                                color: Color(0xff707277),
                              )),
                          Icon(
                            FontAwesome5Solid.laptop_code,
                            size: 30,
                            color: Color(0xff707277),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
    );
  }
}

class Tile extends StatelessWidget {
  final IconData icon;
  final String text;
  final String value;
  Tile({this.icon, this.text, this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 30,
      height: 200,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0x4d707277)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: Color(0xff707277), size: 50),
          Text(
            text,
            style: TextStyle(
              color: Color(0xff707277),
              fontSize: 25,
            ),
          ),
          Text(
            value,
            style: TextStyle(
                color: Color(0xff707277),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
