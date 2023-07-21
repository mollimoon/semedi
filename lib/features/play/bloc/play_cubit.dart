import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:semedi/features/play/bloc/play_state.dart';

import '../../../data/music_data.dart';

class PlayCubit extends Cubit<PlayState> {
  final MusicData music;

  PlayCubit({required this.music}) : super(PlayDataState(music: music, isPlaying: true));

  final _player = AudioPlayer();

  @override
  Future<void> close() {
    _player.dispose();
    return super.close();
  }

  void setupPlayer() async {
    // await player.play(AssetSource('sounds/blue_ocean.wav'));
    await _player.play(UrlSource('https://www.soundjay.com/nature/ocean-wave-1.wav'));
  }

  Future<void> switchPlay() async {
    //обращение к state текущего cubit
    if (state is PlayDataState) {
      final dataState = state as PlayDataState; //приведение типов
      final isPlaying = dataState.isPlaying;

      if (isPlaying) {
        await _player.pause();
      } else {
        await _player.resume();
      }

      emit(PlayDataState(music: dataState.music, isPlaying: !isPlaying));
    }
  }
}
