import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({this.color = Colors.white});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) => Path()
    ..moveTo(0, y)
    ..lineTo(x, y)
    ..lineTo(x, 0)
    ..lineTo(0, y);

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) => oldDelegate.color != color;
}

class Menu extends StatelessWidget {
  Widget _menuPiece({Color color}) => RawMaterialButton(
    onPressed: () {},
    child: CustomPaint(
      painter: TrianglePainter(color: color),
      child: Container(
        width: 600,
        height: 200,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) => Container(
    width: 700,
    height: 700,
    child: Stack(
      children: <Widget>[
      ],
    ),
  );
} 
