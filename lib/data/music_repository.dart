import 'package:semedi/data/music_data.dart';

class MusicRepository {
  List<MusicData> getMusic() { //return list with type MusicData
    return [
      MusicData(
        id: 1,
        image: 'assets/images/peep_blue.png',
        backgroundColorHex: 0xFF217ea5,
        name: 'Falling asleep',
        duration: '10 minutes',
        description: 'Meditation to prepare the mind for sleep',
      ),
      MusicData(
        id: 2,
        image: 'assets/images/peep_green.png',
        backgroundColorHex: 0xFF146354,
        name: 'Anxiety',
        duration: '5 minutes',
        description: 'Soundscapes to calm and ease anxiety',
      ),
      MusicData(
        id: 3,
        image: 'assets/images/peep_navy.png',
        backgroundColorHex: 0xFF1d3eb4,
        name: 'Physical health',
        duration: '12 minutes',
        description: 'Melodies for relaxation and rejuvenation',
      ),
      MusicData(
        id: 4,
        image: 'assets/images/peep_orange.png',
        backgroundColorHex: 0xFFf2a54a,
        name: 'Productivity',
        duration: '7 minutes',
        description: 'Music to enhance focus and productivity',
      ),
      MusicData(
        id: 5,
        image: 'assets/images/peep_red.png',
        backgroundColorHex: 0xFFb7351c,
        name: 'Work life',
        duration: '15 minutes',
        description: 'Tunes for stress relief and work-life balance',
      ),
      MusicData(
        id: 6,
        image: 'assets/images/peep_green.png',
        backgroundColorHex: 0xFFc27ba0,
        name: 'Anxiety',
        duration: '5 minutes',
        description: 'Soundscapes to calm and ease anxiety',
      ),
      MusicData(
        id: 7,
        image: 'assets/images/peep_navy.png',
        backgroundColorHex: 0xFF674ea7,
        name: 'Physical health',
        duration: '12 minutes',
        description: 'Melodies for relaxation and rejuvenation',
      ),
    ];
  }
}
