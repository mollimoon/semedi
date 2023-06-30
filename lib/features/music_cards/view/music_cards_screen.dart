import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:semedi/card_widget.dart';
import 'package:semedi/features/music_cards/bloc/music_cards_cubit.dart';
import 'package:semedi/features/music_cards/bloc/music_cards_state.dart';
import 'package:semedi/l10n/app_strings.dart';

import '../../../play_screen.dart';

class MusicCardsScreen extends StatefulWidget {
  @override
  State<MusicCardsScreen> createState() => _MusicCardsScreenState();
}

class _MusicCardsScreenState extends State<MusicCardsScreen> {
  late final MusicCardsCubit _musicCubit;
  @override
  void initState() {
    super.initState();

    _musicCubit = MusicCardsCubit();
    _musicCubit.fetchMusicData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MusicCardsCubit, MusicCardsState>(
          bloc: _musicCubit,
          builder: (context, state) {
            if (state is MusicCardsSuccessState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    CardWidget(
                      isSelected: true,
                      music: state.currentMusic, //from current state
                      onTap: _goToPlayscreen,
                    ),
                    SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.musicListTitle,
                        style: GoogleFonts.dosis(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2E2F37),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            GridView.count(
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              children: [
                                for (final music in state.musicList)
                                  CardWidget(
                                    music: music,
                                    onTap: () async {
                                      // _goToPlayscreen().then(
                                      //   (_) => _musicCubit.selectMusic(music),
                                      // ); //another example
                                      await _goToPlayscreen();
                                      _musicCubit.selectMusic(music);
                                    },
                                  ),
                              ],
                            ),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is MusicCardsErrorState) {
              return const Text('Something is wrong. Try again');
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }

  Future<void> _goToPlayscreen() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PlayScreen(),
      ),
    );
  }
}
