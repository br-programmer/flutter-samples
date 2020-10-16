import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/music_app/bloc/music_app_bloc.dart';
import 'package:flutter_samples/music_app/bloc/music_player_bloc.dart';
import 'package:flutter_samples/music_app/utils/constans.dart';
import 'package:provider/provider.dart';

class PlayPause extends StatefulWidget {
  const PlayPause({Key key}) : super(key: key);

  @override
  _PlayPauseState createState() => _PlayPauseState();
}

class _PlayPauseState extends State<PlayPause>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final musicBloc = Provider.of<MusicAppBLoC>(context, listen: false);
    final musicPlayerBloc =
        Provider.of<MusicPlayerBLoC>(context, listen: false);
    return ValueListenableBuilder(
      valueListenable: musicPlayerBloc.musicPlayer.status,
      builder: (_, status, __) {
        if (musicPlayerBloc.musicPlayer.loading) {
          return CircleAvatar(
              radius: 25,
              backgroundColor: MusicAppColors.bluePurple,
              child: CupertinoActivityIndicator());
        } else if (musicPlayerBloc.musicPlayer.error) {
          return CircleAvatar(
              radius: 25,
              backgroundColor: MusicAppColors.bluePurple,
              child: Icon(Icons.error, color: Colors.redAccent));
        } else {
          if(musicPlayerBloc.musicPlayer.playing){
            _controller.forward();
            musicBloc.isPlay = true;
          }else if(musicPlayerBloc.musicPlayer.paused){
            _controller.reverse();
            musicBloc.isPlay = false;
          }
          return ValueListenableBuilder<bool>(
            valueListenable: musicBloc.playing,
            builder: (_, value, __) {
              return GestureDetector(
                onTap: () {
                  if (value) {
                    _controller.reverse();
                    musicPlayerBloc.musicPlayer.pause();
                  } else {
                    _controller.forward();
                    if (musicPlayerBloc.musicPlayer.initial) {
                      musicPlayerBloc.musicPlayer.resume(index: 1);
                    } else {
                      musicPlayerBloc.musicPlayer.resume();
                    }
                  }
                  musicBloc.isPlay = !value;
                },
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: MusicAppColors.bluePurple,
                  child: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: _controller,
                      color: Colors.white,
                      size: 30),
                ),
              );
            },
          );
        }
      },
    );
  }
}
