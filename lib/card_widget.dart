import 'package:flutter/material.dart';
import 'package:semedi/l10n/app_strings.dart';
import 'package:semedi/features/play/view/play_screen.dart';

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
    var splitName = '';
    if (isSelected) {
      splitName = music.name;
    } else {
      final textList = music.name.split(' ');
      for (var i = 0; i < textList.length; i++) {
        splitName += textList[i];
        if (i != textList.length - 1) {
          splitName += '\n';
        }
      }
    }

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
                  alignment: Alignment.bottomLeft,
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
                        color: Color(0xFFf9faff),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          music.duration,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        splitName,
                        // music.name,
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
