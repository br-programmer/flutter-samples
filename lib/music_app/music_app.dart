import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/music_app/bloc/music_app_bloc.dart';
import 'package:flutter_samples/music_app/bloc/page_view_bloc.dart';
import 'package:flutter_samples/music_app/pages/home/home.dart';
import 'package:provider/provider.dart';

class MusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MusicAppBLoC()),
        ChangeNotifierProvider(create: (_) => PageViewBLoC()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Home(),
      ),
    );
  }
}
