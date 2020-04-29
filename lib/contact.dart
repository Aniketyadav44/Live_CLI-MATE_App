import "package:flutter/material.dart";
import 'package:flutter_icons/flutter_icons.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage("images/aniket.jpg"),
                radius: 50,
              ),
              Text(
                "Aniket Yadav",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    fontFamily: "Pacifico"),
              ),
              Text(
                "LEARNER | DEVELOPER",
                style: TextStyle(
                  fontFamily: "Source Sans Pro",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                  color: Colors.blue.shade100,
                ),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.blue.shade100,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "aniani4848@gmail.com",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Source Sans Pro",
                        color: Colors.blue.shade900),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    FontAwesome.instagram,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "@aniket.codes",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Source Sans Pro",
                        color: Colors.blue.shade900),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    FontAwesome.twitter,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "@AniketY8888",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Source Sans Pro",
                        color: Colors.blue.shade900),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    FontAwesome.linkedin,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "Aniket Yadav",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Source Sans Pro",
                        color: Colors.blue.shade900),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
