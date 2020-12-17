import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/music_app/bloc/music_player_bloc.dart';
import 'package:flutter_samples/apps/music_app/widgets/play_pause.dart';
import 'package:provider/provider.dart';

class Controls extends StatelessWidget {
  const Controls({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final musicPlacerBloc = Provider.of<MusicPlayerBLoC>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: AspectRatio(
        aspectRatio: 16 / 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(Icons.shuffle),
            Row(
              children: [
                GestureDetector(
                  onTap: musicPlacerBloc.onPrevius,
                  child: Padding(padding: const EdgeInsets.only(right: 15), child: Icon(Icons.skip_previous)),
                ),
                const PlayPause(),
                GestureDetector(
                  onTap: musicPlacerBloc.onNext,
                  child: Padding(padding: const EdgeInsets.only(left: 15), child: Icon(Icons.skip_next)),
                ),
              ],
            ),
            Icon(Icons.repeat),
          ],
        ),
      ),
    );
  }
}
