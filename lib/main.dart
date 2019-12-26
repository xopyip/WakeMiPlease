import 'package:flutter/material.dart';
import 'package:wake_mi_please/constants.dart';

import 'band.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WakeMiPlease',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConfigurationPage(title: 'Konfiguracja'),
    );
  }
}

class ConfigurationPage extends StatefulWidget {
  ConfigurationPage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _ConfigurationPageState createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {

  Band _band;


  _ConfigurationPageState(){
    _band = new Band("");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sparowano z:',
            ),
            Text(
              '${_band.getAddr()}',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _check,
        tooltip: 'Rozlacz',
        child: Icon(Icons.remove),
      ),
    );
  }

  void _check() {
    _band.getCharacteristic(UUIDs.SERVICE_ALERT_NOTIFICATION, UUIDs.CHARACTERISTIC_CUSTOM_ALERT).then((c){
      List<int> out = new List();
      out.add(1); // email
      out.add(1); // number of alerts
      for (var value in "test".codeUnits) {
        out.add(value);
      }
      c.write(out);
    });
  }
}
