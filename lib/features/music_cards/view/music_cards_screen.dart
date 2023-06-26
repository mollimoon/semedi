import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:semedi/card_widget.dart';
import 'package:semedi/features/music_cards/bloc/music_cards_cubit.dart';
import 'package:semedi/features/music_cards/bloc/music_cards_state.dart';

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
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: Column(
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      CardWidget(
                        isSelected: true,
                        music: state.currentMusic, //from current state
                      ),
                      SizedBox(
                        height: 24,
                      ),
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
                          for (final music in state.musicList)
                            CardWidget(
                              music: music,
                            ),
                        ],
                      ),
                    ],
                  ),
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
}
