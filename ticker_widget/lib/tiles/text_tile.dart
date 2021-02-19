import 'package:flutter/material.dart';
import 'tile.dart';

class TextTile implements Tile{

  final BuildContext context;
  final String text;
  final TextStyle style;
  final Color backgroundColor;
  final TextDirection textDirection;
  final double margin;

  final Paint _paint;

  TextTile({@required this.context,
            this.text="",
            TextStyle style,
            Color backgroundColor,
            this.margin = 10,
            this.textDirection = TextDirection.ltr }):
        this.style = style ?? TextStyle(color: Colors.black, fontSize: 22),
        this.backgroundColor = backgroundColor ?? Colors.yellow,
        _paint  = Paint()
          ..color = backgroundColor ?? Colors.yellow
          ..style = PaintingStyle.fill;

  @override
  paint(Canvas canvas, Rect rect, double animPercent) {
      var painter = textPainter;
      painter.layout();
      canvas.drawRect(rect, _paint);
      painter.paint(canvas, Offset(rect.left + margin, (rect.height - painter.size.height)/2));
  }

  TextPainter get textPainter{
    var mq = MediaQuery.of(context, nullOk: true);
    double textScaleFactor = mq == null ? 1.0 : mq.textScaleFactor;
    return TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textScaleFactor: textScaleFactor,
        textDirection: textDirection);
  }

  @override
  double get width{
    final Size size = (textPainter
      ..layout())
        .size;

    return size.width + 2 * margin;

  }

}