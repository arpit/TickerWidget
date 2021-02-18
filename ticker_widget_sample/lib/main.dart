import 'package:flutter/material.dart';
import 'package:ticker_widget/ticker_widget.dart';
import 'package:ticker_widget/tiles/sine_wave_tile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var tile = SineWaveTile(strokeColor: Colors.green, amplitude: 20);

    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: SizedBox(
                width: 200, height:200,
                child: Container(
                    color:Colors.white,
                    child:TickerWidget(tile, tileAnimDuration: 1,animDirection: -1,)
                )
            )
        ),
      ),
    );
  }
}
