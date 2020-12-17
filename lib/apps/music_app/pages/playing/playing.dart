import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/music_app/bloc/music_app_bloc.dart';
import 'package:flutter_samples/apps/music_app/pages/playing/widgets/widgets.dart';
import 'package:flutter_samples/apps/music_app/utils/constans.dart';
import 'package:provider/provider.dart';

class Playing extends StatelessWidget {
  const Playing({Key key}) : super(key: key);

  void _onVerticalGesture(DragUpdateDetails details, MusicAppBLoC musicBLoC) {
    if (details.primaryDelta < -12) {
      musicBLoC.musicAppState = MusicAppState.playing;
    }
  }

  @override
  Widget build(BuildContext context) {
    final musicBLoC = Provider.of<MusicAppBLoC>(context, listen: false);
    return ValueListenableBuilder<MusicAppState>(
      valueListenable: musicBLoC.state,
      builder: (_, state, __) => AnimatedPositioned(
        duration: const Duration(milliseconds: 250),
        right: 0,
        left: 0,
        top: (state == MusicAppState.initial) ? MediaQuery.of(context).size.height - (kToolbarHeight * 2.75) : 0.0,
        height: MediaQuery.of(context).size.height,
        child: GestureDetector(
          onVerticalDragUpdate: (value) => _onVerticalGesture(value, musicBLoC),
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              decoration: BoxDecoration(
                color: (state == MusicAppState.initial) ? MusicAppColors.bluePurple : MusicAppColors.primary,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular((state == MusicAppState.initial) ? 25 : 0),
                ),
              ),
              child: Column(children: [const HeaderPlaying(), const BodyPlaying()])),
        ),
      ),
    );
  }
}

class BodyPlaying extends StatelessWidget {
  const BodyPlaying({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final musicBLoC = Provider.of<MusicAppBLoC>(context, listen: false);
    return ValueListenableBuilder<MusicAppState>(
      valueListenable: musicBLoC.state,
      builder: (_, state, __) => Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: kBottomNavigationBarHeight, bottom: kBottomNavigationBarHeight * 2),
          child: Column(
            children: [
              const ListMusic(),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const NameMusicAndArtist(),
                    const MusicTrends(),
                    const TimeAndIndicator(),
                    const Controls()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
