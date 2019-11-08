import 'dart:async';

import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'package:portfolio/constants.dart';

class Clock extends StatefulWidget {
  final _ClockState state = _ClockState();

  @override
  _ClockState createState() => this.state;
}

class _ClockState extends State<Clock> with SingleTickerProviderStateMixin {
  Map<String, String> _timeStrings;
  AnimationController controller;
  
  @override
  void initState() {
    super.initState();
    this._timeStrings = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    this.controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    this.controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    this.controller.dispose();
  }

  void _getTime() => setState(() => this._timeStrings = _formatDateTime(DateTime.now()));

  Map<String, String> _formatDateTime(DateTime dateTime) => {
    'date':   DateFormat('LLLL. d').format(dateTime),
    'day':    DateFormat(' (E)').format(dateTime),
    'time':   DateFormat('H:mm').format(dateTime),
    'second': DateFormat('.ss').format(dateTime.add(Duration(seconds: 1))),
  };

  @override
  Widget build(BuildContext context) => AlignTransition(
    alignment: Tween<AlignmentGeometry>(
      begin: Alignment.centerRight,
      end: Alignment.topRight,
    ).animate(this.controller),
    child: FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(this.controller),
      child: Container(
        margin: EdgeInsets.all(windowSize.width / 20),
        width: 400,
        height: 200,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  this._timeStrings['time'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  this._timeStrings['second'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  this._timeStrings['date'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  this._timeStrings['day'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
