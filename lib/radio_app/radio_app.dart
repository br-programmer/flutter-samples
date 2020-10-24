import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/radio_app/bloc/radio_bloc.dart';
import 'package:flutter_samples/radio_app/models/station.dart';
import 'package:flutter_samples/radio_app/pages/welcome/welcome.dart';
import 'package:provider/provider.dart';

class RadioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ChangeNotifierProvider(
      create: (_) => RadioBLoC(stations),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'SFDisplay'),
        home: Welcome(),
      ),
    );
  }
}
