import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/music_app/bloc/music_app_bloc.dart';
import 'package:flutter_samples/music_app/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CustomButtonNavigation extends StatelessWidget {
  const CustomButtonNavigation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: kBottomNavigationBarHeight * 1.25,
        decoration: BoxDecoration(
            color: MusicAppColors.secondary,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
            children: items
                .map((e) => _ItemNavigation(path: e, index: items.indexOf(e)))
                .toList()),
      ),
    );
  }
}

class _ItemNavigation extends StatelessWidget {
  const _ItemNavigation({Key key, @required this.index, @required this.path})
      : super(key: key);

  final int index;
  final String path;

  @override
  Widget build(BuildContext context) {
    final musicBLoC = Provider.of<MusicAppBLoC>(context, listen: false);
    return Expanded(
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          if (musicBLoC.state.value == MusicAppState.playing) {
            musicBLoC.musicAppState = MusicAppState.initial;
          } else {
            musicBLoC.changeIndex = index;
          }
        },
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: ValueListenableBuilder<int>(
              valueListenable: musicBLoC.indexSelected,
              builder: (_, value, __) => AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: (index == value)
                      ? MusicAppColors.bluePurple
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SvgPicture.asset(path, color: Colors.white70, width: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
