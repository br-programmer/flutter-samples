import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/music_app/bloc/music_player_bloc.dart';
import 'package:flutter_samples/music_app/models/music.dart';
import 'package:flutter_samples/music_app/pages/home/widgets/widgets.dart';
import 'package:flutter_samples/music_app/pages/playing/playing.dart';
import 'package:flutter_samples/music_app/utils/constans.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MusicPlayerBLoC(musics, context),
      child: Scaffold(
        backgroundColor: MusicAppColors.primary,
        body: Stack(
          children: [const Body(), const Playing(), const CustomButtonNavigation()],
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          const Header(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [const Select(), const TopWeekly(), const ListTopWeekly()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
