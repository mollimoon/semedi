import 'package:flutter/material.dart';
import 'package:semedi/data/music_data.dart';


class PlayScreen extends StatefulWidget {
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  bool isPlaying = true;

  @override
  Widget build(BuildContext context) {
    final musicChoice = ModalRoute.of(context)?.settings.arguments as MusicData; //распаковка данных
    return Scaffold(
      backgroundColor: Color(musicChoice.backgroundColorHex),
      body: Center(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Text(
              musicChoice.name,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              musicChoice.description,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),

            SizedBox(
              height: 44,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isPlaying = !isPlaying;
                  if (isPlaying) {
                    // player.pause()
                  } else {
                    // player.play()
                  }
                });
              },
              child: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white,),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red, backgroundColor: Color(0xFFFF7338), shape: CircleBorder(),
                padding: EdgeInsets.all(20), // <-- Splash color
              ),
            )
          ],
        ),
      ),
    );
  }
}
