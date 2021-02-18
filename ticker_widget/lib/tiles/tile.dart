import 'package:flutter/material.dart';

abstract class Tile{
  paint(Canvas canvas, Rect rect, double animPercent);
  double get width;
}