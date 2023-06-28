import 'package:flutter/material.dart';
import 'package:semedi/l10n/app_strings.dart';
import 'package:semedi/play_screen.dart';

import 'data/music_data.dart';

class CardWidget extends StatelessWidget {
  final bool isSelected;
  final MusicData music;
  final VoidCallback onTap;

  CardWidget({
    this.isSelected = false,
    required this.music,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final boxShadow = isSelected
        ? [
            // color: Colors.white, //background color of box
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: Offset(
                0.0, // Move to right 10  horizontally
                4.0, // Move to bottom 10 Vertically
              ),
            ),
          ]
        : null;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        color: Color(music.backgroundColorHex),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end, //move pic down
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  music.image,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                      decoration: BoxDecoration(
                        boxShadow: boxShadow,
                        color: Color(0xFFf9faff),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        music.duration,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 36),
                  Text(
                    music.name,
                    style: TextStyle(
                      fontSize: isSelected ? 32 : 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  if (isSelected)
                    Text(
                      music.description,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
