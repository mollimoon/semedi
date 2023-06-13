import 'package:flutter/material.dart';
import 'package:semedi/card_element.dart';

class MusicCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              CardWidget(
                image: 'images/peep_blue.png',
                backgroundColor: Color(0xFF217ea5),
                textTitle: 'Falling asleep',
                isSelected: true,
                fontSize: 32,
                textTime: '10 minutes',
              ),
              SizedBox(height: 24,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Made for you',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2E2F37),
                  ),
                ),
              ),
              GridView.count(
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                shrinkWrap: true,
                crossAxisCount: 2,
                children: [
                  CardWidget(
                    image: 'images/peep_green.png',
                    backgroundColor: Color(0xFF146354),
                    textTitle: 'Anxiety',
                    fontSize: 16,
                    textTime: '5 minutes',
                  ),
                  CardWidget(
                    image: 'images/peep_navy.png',
                    backgroundColor: Color(0xFF1d3eb4),
                    textTitle: 'Physical \n health',
                    fontSize: 16,
                    textTime: '12 minutes',
                  ),
                  CardWidget(
                    image: 'images/peep_orange.png',
                    backgroundColor: Color(0xFFf2a54a),
                    textTitle: 'Productivity',
                    fontSize: 16,
                    textTime: '7 minutes',
                  ),
                  CardWidget(
                    image: 'images/peep_red.png',
                    backgroundColor: Color(0xFFb7351c),
                    textTitle: 'Work life',
                    fontSize: 16,
                    textTime: '15 minutes',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
