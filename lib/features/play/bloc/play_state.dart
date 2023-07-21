import 'package:equatable/equatable.dart';

import '../../../data/music_data.dart';

class PlayState {}

class PlayDataState extends PlayState with EquatableMixin {
  final MusicData music;
  final bool isPlaying;

  PlayDataState({
    required this.music,
    required this.isPlaying,
  });

  @override
  List<Object?> get props => [music];
}

// class PlayErrorState extends PlayState with EquatableMixin {
//   final String errorText;
//   PlayErrorState({required this.errorText});
//
//   @override
//   List<Object?> get props => [errorText];
// }
