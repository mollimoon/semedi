import 'package:semedi/data/music_repository.dart';
import 'package:semedi/features/music_cards/bloc/music_cards_state.dart';
import 'package:bloc/bloc.dart';

import '../../../data/music_data.dart';

class MusicCardsCubit extends Cubit<MusicCardsState> {
  MusicCardsCubit() : super(MusicCardsLoadingState()); // 1st state

  final _musicRepository = MusicRepository();

  void fetchMusicData() {
    _getAndChangeMusic();
  }

  void selectMusic(MusicData selectedMusic) {
    _getAndChangeMusic(selectedMusic: selectedMusic);
  }

  void _getAndChangeMusic({MusicData? selectedMusic}) { //? means - can be null
    emit(MusicCardsLoadingState());

    // if (state is MusicCardsSuccessState) {
    //   final list = (state as MusicCardsSuccessState).musicList;
    // }
    // example

    try {
      final list = _musicRepository.getMusic();
      final currentMusic = selectedMusic ?? list.first;
      final filteredList = list.where((element) => element.id != currentMusic.id).toList();

      emit(MusicCardsSuccessState(musicList: filteredList, currentMusic: currentMusic));
    } catch (e) {
      emit(MusicCardsErrorState(errorText: e.toString()));
    }
  }
}
