import 'package:Hecate/screens/home.dart';
import 'package:Hecate/screens/mapScreen.dart';
import 'package:Hecate/screens/telemetryScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/map',
      routes: {
        '/map' : (context) => MapScreen(),
        '/telemetry' : (context) => TelemetryScreen(),
      }
    );
  }
}