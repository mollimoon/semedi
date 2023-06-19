import 'package:semedi/data/music_repository.dart';
import 'package:semedi/features/music_cards/bloc/music_cards_state.dart';
import 'package:bloc/bloc.dart';

class MusicCardsCubit extends Cubit<MusicCardsState> {
  MusicCardsCubit() : super(MusicCardsLoadingState());

  final _musicRepository = MusicRepository();

  void fetchMusicData() {
    emit(MusicCardsLoadingState());

    try {
      final musicList = _musicRepository.getMusic();

      emit(MusicCardsSuccessState(musicList: musicList));
    } catch (e) {
      emit(MusicCardsErrorState(errorText: e.toString()));
    }
  }
}
