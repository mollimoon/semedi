import 'package:semedi/data/music_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:semedi/features/play/bloc/play_state.dart';

import '../../../data/music_data.dart';

class PlayCubit extends Cubit<PlayState> {
  final MusicData music;

  PlayCubit({required this.music}) : super(PlayDataState(music: music));


}