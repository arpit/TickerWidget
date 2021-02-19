import 'package:flutter/material.dart';
import 'package:ticker_widget/ticker_widget.dart';
import 'package:ticker_widget/tiles/sine_wave_tile.dart';
import 'package:ticker_widget/tiles/text_tile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var textTile = TextTile(context:context, text: "Hello World");
    var textTile2 = TextTile(context:context, text: "Good morning", backgroundColor: Colors.amber );
    var sineTile = SineWaveTile(strokeColor: Colors.yellow, amplitude: 16, period: 60);
    var sineTile2 = SineWaveTile(strokeColor: Colors.amber, amplitude: 4, period: 30);

    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.blueAccent, title: Text("Ticker Example"),),
        body: Column(
          children: [
            Expanded(child: SizedBox()),
            FractionallySizedBox(
              widthFactor: 1,
              child: SizedBox(
                height: 50,
                child: TickerWidget(textTile, tileAnimDuration: 1,animDirection: -1,),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 1,
              child: SizedBox(
                height: 50,
                child: TickerWidget(textTile2, tileAnimDuration: 4,animDirection: 1,),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 1,
              child: SizedBox(
                height: 50,
                child: TickerWidget(sineTile, tileAnimDuration: 1,animDirection: -1,),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 1,
              child: SizedBox(
                height: 50,
                child: TickerWidget(sineTile2, tileAnimDuration: 1,animDirection: -1,),
              ),
            ),
            Expanded(child: SizedBox()),
          ],
        )
      ),
    );
  }
}
