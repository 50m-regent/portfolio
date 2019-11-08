import 'package:flutter/material.dart';

import 'package:portfolio/menu.dart';
import 'package:portfolio/clock.dart';
import 'package:portfolio/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Len Hirata a.k.a. 50m_regent Portfolio',
    theme: ThemeData.dark(),
    home: MyHomePage(),
  );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Clock _clock = Clock();
  Menu _menu;

  void initState() {
    super.initState();
    this._menu  = Menu(parent: this);
  }

  void cleanPage() {
    this._clock.state.controller.reverse();
    this._menu.state.controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    windowSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                child: this._clock,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: this._menu,
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
}
