import 'dart:async';

import 'package:intl/intl.dart';

import 'package:flutter_web/material.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> with SingleTickerProviderStateMixin {
  Map<String, String> _timeStrings;
  AnimationController _controller;
  
  @override
  void initState() {
    super.initState();
    _timeStrings = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _getTime() => setState(() => _timeStrings = _formatDateTime(DateTime.now()));

  Map<String, String> _formatDateTime(DateTime dateTime) => {
    'date':   DateFormat('LLLL. d').format(dateTime),
    'day':    DateFormat(' (E)').format(dateTime),
    'time':   DateFormat('H:mm').format(dateTime),
    'second': DateFormat('.ss').format(dateTime),
  };

  @override
  Widget build(BuildContext context) => AlignTransition(
    alignment: Tween<AlignmentGeometry>(
      begin: Alignment.bottomRight,
      end: Alignment.topRight,
    ).animate(_controller),
    child: FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(_controller),
      child: Container(
        margin: EdgeInsets.all(100),
        width: 400,
        height: 200,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _timeStrings['time'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _timeStrings['second'],
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
                  _timeStrings['date'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _timeStrings['day'],
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
