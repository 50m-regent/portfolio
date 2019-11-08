import 'package:flutter/material.dart';

import 'package:portfolio/constants.dart';

class Menu extends StatefulWidget {
  final dynamic parent;
  final _MenuState state = _MenuState();

  Menu({this.parent});

  @override
  _MenuState createState() => this.state;
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
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

  Widget _logo() => FadeTransition(
    opacity: Tween<double>(
      begin: 0,
      end: 1,
    ).animate(this.controller),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            'Len Hirata',
            style: TextStyle(
              color: Colors.white,
              fontSize: 100,
            ),
          ),
          Text(
            'a.k.a. 50m_regent\na.k.a. りーぜんと',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
        ],
      ),
    ),
  );

  Widget _button(String title) => RawMaterialButton(
    onPressed: () {
      this.widget.parent.cleanPage();
    },
    child: Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  Widget _row1() => AlignTransition(
    alignment: Tween<AlignmentGeometry>(
      begin: Alignment(-2, 0.5),
      end: Alignment.centerLeft,
    ).animate(this.controller),
    child: FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(this.controller),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: windowSize.width / 10),
        width: 600,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button('Profile'),
                _button('History'),
              ],
            ),
            Container(
              height: 5,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _row2() => AlignTransition(
    alignment: Tween<AlignmentGeometry>(
        begin: Alignment(-2, 0.5),
        end: Alignment(-0.6, -1),
      ).animate(this.controller),
    child: FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(this.controller),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: windowSize.width / 10),
        width: 600,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button('Skills'),
                _button('Works'),
              ],
            ),
            Container(
              height: 5,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) => Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _logo(),
        Container(
          height: windowSize.height / 5,
        ),
        _row1(),
        Container(
          height: windowSize.width / 20,
        ),
        _row2(),
      ],
    ),
  );
} 
