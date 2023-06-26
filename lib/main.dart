import 'package:flutter/material.dart';
import 'features/music_cards/view/music_cards_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MusicCardsScreen(), //показ-т с какой точки начнет показ
    );
  }
}
