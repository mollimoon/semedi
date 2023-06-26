import 'package:semedi/data/music_repository.dart';
import 'package:semedi/features/music_cards/bloc/music_cards_state.dart';
import 'package:bloc/bloc.dart';

class MusicCardsCubit extends Cubit<MusicCardsState> {
  MusicCardsCubit() : super(MusicCardsLoadingState()); // 1st state

  final _musicRepository = MusicRepository();

  void fetchMusicData() {
    emit(MusicCardsLoadingState());

    // if (state is MusicCardsSuccessState) {
    //   final list = (state as MusicCardsSuccessState).musicList;
    // }
    // example

    try {
      final musicList = _musicRepository.getMusic();
      final currentMusic = musicList.first;
      final filteredList = musicList.where((element) => element.id != currentMusic.id).toList();

      emit(MusicCardsSuccessState(musicList: filteredList, currentMusic: currentMusic));
    } catch (e) {
      emit(MusicCardsErrorState(errorText: e.toString()));
    }
  }
}
