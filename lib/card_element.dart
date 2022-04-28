import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardWidget extends StatelessWidget {
  final bool isSelected;
  final String image;
  final Color backgroundColor;
  final String textTitle;
  final String textTime;

  CardWidget({
   this.isSelected = false,
    this.image,
    this.backgroundColor,
    this.textTitle,
    this.textTime,
});


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      color: backgroundColor,
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(image),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                      boxShadow: [
                        // color: Colors.white, //background color of box
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4.0, // soften the shadow
                          spreadRadius: 0.0, //extend the shadow
                          offset: Offset(
                            0.0, // Move to right 10  horizontally
                            4.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                      color: Color(0xFFf9faff),
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    '10 minutes',
                    style: GoogleFonts.dosis(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                    height: 36),
                Text(
                  'Falling asleep',
                  style: GoogleFonts.dosis(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Meditation to prepare the mind for sleep',
                  style: GoogleFonts.dosis(
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
                    style: GoogleFonts.dosis(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFFFF7338),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

