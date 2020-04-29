import 'package:flutter/material.dart';
import './loading.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        indicatorColor: Colors.black,
        fontFamily: "BalooTamma",
      ),
      home:LoadingPage());
  }
}