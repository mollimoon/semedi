import 'package:flutter/material.dart';
import 'package:semedi/play_screen.dart';

class CardWidget extends StatelessWidget {
  final bool isSelected;
  final String image;
  final Color backgroundColor;
  final String textTitle;
  final String textTime;
  final double fontSize;

  CardWidget({
    this.isSelected = false,
    required this.image,
    required this.backgroundColor,
    required this.textTitle,
    required this.textTime,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final boxShadow = isSelected ? [
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
    ] : null;

    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      color: backgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end, //move pic down
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                image,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                      boxShadow: boxShadow,
                      color: Color(0xFFf9faff),
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    textTime,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                // SizedBox(height: 36),
                Text(
                  textTitle,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                if (isSelected) ...[Text(
                        'Meditation to prepare the mind for sleep',
                  style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                        child: Text(
                          'Getting started',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => PlayScreen(),), //переход на др стр
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFFFF7338),
                          ),
                        ),
                      ),],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
