
import 'package:Hecate/screens/mapScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelemetryScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TelemetryScreenState();
  }
}

class _TelemetryScreenState extends State<TelemetryScreen>{

    @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            title: Text('Maps Sample App'),
            backgroundColor: Colors.red[700],
        ),
        body: RaisedButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MapScreen()),
            );
          },
        )
      );

  }
}