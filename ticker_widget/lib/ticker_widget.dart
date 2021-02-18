library ticker_widget;

import 'package:flutter/material.dart';
import 'tiles/tile.dart';



class TickerWidget extends StatefulWidget {

  final Tile _tile;

  // How fast a tile animates across
  // Note that a ticker is made of multiple tiles
  final int tileAnimDuration;
  final int animDirection;

  TickerWidget(this._tile, {this.tileAnimDuration = 4, this.animDirection = 1});


  @override
  _TickerWidgetState createState() => _TickerWidgetState();
}

class _TickerWidgetState extends State<TickerWidget> with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.tileAnimDuration),
    );

    final Tween<double> _tween = Tween(begin: 0.0, end: 1);
    animation = _tween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, snapshot) {
        return CustomPaint(
          painter: AnimatedTilePainter(widget._tile, animation.value, widget.animDirection),
          child: Container(),
        );
      },
    );
  }
}

class AnimatedTilePainter extends CustomPainter{

  final Tile _tile;
  final double _animPercent;// from 0 to 1
  int _animDirection = 1;

  AnimatedTilePainter(this._tile, this._animPercent, this._animDirection);

  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Rect.fromLTRB(0, 0, size.width, size.height));
    final numTiles = (size.width / _tile.width).ceil() + 1;

    if(_animDirection == 1){
      canvas.translate(_animPercent * _tile.width, 0);
      var extraRect = Rect.fromLTRB(-_tile.width,0, 0, size.height);
      _tile.paint(canvas, extraRect, _animPercent);
    }
    else{
      canvas.translate(-1 * _animPercent * _tile.width, 0);
      var extraRect = Rect.fromLTRB(numTiles*_tile.width,0, (numTiles*_tile.width)+_tile.width, size.height);
      _tile.paint(canvas, extraRect, _animPercent);
    }
    
    for(var i=0; i<numTiles; i++){
      var left = i*_tile.width;
      final rect = Rect.fromLTRB(left,0, left + size.width, size.height);
      _tile.paint(canvas, rect, _animPercent);
    }



  }

  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}
