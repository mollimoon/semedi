import 'package:equatable/equatable.dart';

import '../../../data/music_data.dart';

class MusicCardsState {} //главный родительский класс

class MusicCardsLoadingState extends MusicCardsState with EquatableMixin {
  @override
  List<Object?> get props => []; //hash сравн с одинак.тип.данных
}

class MusicCardsSuccessState extends MusicCardsState with EquatableMixin {
  final MusicData currentMusic;
  final List<MusicData> musicList; // отвечает за отображение полученных данных <musicData>
  MusicCardsSuccessState({required this.musicList, required this.currentMusic});

  @override
  List<Object?> get props => [musicList, currentMusic];
}

class MusicCardsErrorState extends MusicCardsState with EquatableMixin {
  final String errorText;
  MusicCardsErrorState({required this.errorText});

  @override
  List<Object?> get props => [errorText];
}