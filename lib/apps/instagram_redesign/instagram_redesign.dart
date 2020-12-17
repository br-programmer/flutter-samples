import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/instagram_redesign/instagram_main.dart';
import 'package:flutter_samples/apps/instagram_redesign/theme/theme.dart';

class InstagramRedesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: InstagramMain(),
    );
  }
}
