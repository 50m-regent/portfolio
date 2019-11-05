import 'package:flutter_web/material.dart';

import 'package:portfolio/menu.dart';
import 'package:portfolio/clock.dart';

const String _title = 'Len Hirata A.K.A 50m_regent Portfolio';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: _title,
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _clock = Clock();
  final _menu  = Menu();

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              child: _clock,
            ),
            Container(
              alignment: Alignment.center,
              child: _menu,
            ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: <double>[
              0, 0.3, 0.7,
            ],
            colors: <Color>[
              Colors.grey[800],
              Colors.grey[850],
              Colors.grey[900],
            ]
          ),
        ),
      ),
    ),
  );
}
