import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:semedi/card_element.dart';

class MusicCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardWidget(),
            CardWidget(),
          ],
        ),
      ),
    );
  }
}
