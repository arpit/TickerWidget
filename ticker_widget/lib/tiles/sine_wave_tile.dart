import 'package:flutter/material.dart';
import 'tile.dart';
import 'dart:math';

class SineWaveTile implements Tile{

  final Path path = Path();

  final period;
  final amplitude;
  final segments;
  Color color;
  Paint _paint;

  SineWaveTile(
      {Color strokeColor, double strokeWidth=5, this.period=100, this.amplitude=40, this.segments=20}){

      color = strokeColor ?? Colors.red;
      _paint = Paint()
        ..color = color
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;
  }


  double calculateOffsetRadians(double lineStart, double pointX) {
    final proportionOfPeriod = (pointX - lineStart) / period;
    return proportionOfPeriod * 2 * pi;
  }

  double get width{
    return period.toDouble();
  }


  void paint(Canvas canvas, Rect rect, double animPercent) {


    path.reset();

    final baseline = rect.size.height/2;

    for (int i = 0; i <= segments; i++) {
      final pointX = (period / segments) * i + rect.left ;
      final radiansX =
      calculateOffsetRadians(0, pointX);
      final offsetY = sin(radiansX) * this.amplitude;
      final y = baseline + offsetY;

      if (i == 0) {
        path.moveTo(pointX, y);
      } else {
        path.lineTo(pointX, y);
      }
    }

    canvas.drawPath(path, _paint);

  }

}