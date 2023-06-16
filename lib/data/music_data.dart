class MusicData { //модель данных
  final int id;
  final String image;
  final String backgroundColorHex;
  final String name;
  final String duration;
  final String description;

  MusicData( {
    required this.id,
    required this.image,
    required this.backgroundColorHex,
    required this.name,
    required this.duration,
    required this.description,
  });
}
