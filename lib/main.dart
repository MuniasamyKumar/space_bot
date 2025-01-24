import 'package:flutter/material.dart';
import 'package:space_bot/pages/home_page.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey.shade900,
        primaryColor: Colors.deepOrange.shade300
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}