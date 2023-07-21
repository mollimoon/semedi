import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:semedi/data/music_data.dart';
import 'package:semedi/features/play/bloc/play_state.dart';

import '../bloc/play_cubit.dart';

class PlayScreen extends StatefulWidget {
  final MusicData music; // получаем из навигации

  PlayScreen({required this.music});

  // TODO 1: Constructor with music to play +

  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  // TODO 4: Implement bloc and move player and play status into it +
  late final PlayCubit _playCubit;

  final player = AudioPlayer();
  bool isPlaying = true;

  @override
  void initState() {
    super.initState();
    _playCubit = PlayCubit(music: widget.music); //обращение к полям stateful widget

    setupPlayer(); // TODO 6: Replace this by bloc call
    player.eventStream.listen((AudioEvent event) {
      print(event.eventType);
    });
  }

  // TODO 5: Move this logic to bloc
  void setupPlayer() async {
    // await player.play(AssetSource('sounds/blue_ocean.wav'));
    await player.play(UrlSource('https://www.soundjay.com/nature/ocean-wave-1.wav'));
  }

  @override
  void dispose() {
    player.dispose(); // TODO 7: Don't forget to dispose player in bloc
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO 3: Remove it. Music have to play from bloc state +
    // final musicChoice = ModalRoute.of(context)?.settings.arguments as MusicData; //распаковка данных
    return BlocBuilder<PlayCubit, PlayState>(
        bloc: _playCubit,
        builder: (context, state) {
          if (state is PlayDataState) {
            final musicChoice = state.music;

            return Scaffold(
              backgroundColor: Color(musicChoice.backgroundColorHex),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  Column(
                    children: [
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
                      // TODO 9: Replace button by circle indicator while music is loading
                      // TODO 10: Add one more state when music is finished and we want to re-play
                      ElevatedButton(
                        onPressed: () async {
                          // TODO 8: Move all this logic to bloc
                          if (isPlaying) {
                            await player.pause();
                          } else {
                            await player.resume();
                          }
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                        child: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.red, backgroundColor: Color(0xFFFF7338), shape: CircleBorder(),
                          padding: EdgeInsets.all(20), // <-- Splash color
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset(
                      musicChoice.image,
                      height: 250,
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink(); //as minimum as possible
        });
  }
}
