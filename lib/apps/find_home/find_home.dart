import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/apps/find_home/pages/login/login.dart';
import 'package:google_fonts/google_fonts.dart';

class FindHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(textTheme: GoogleFonts.rubikTextTheme()),
      darkTheme: ThemeData.dark().copyWith(textTheme: GoogleFonts.rubikTextTheme()),
      themeMode: ThemeMode.system,
      home: Login(),
    );
  }
}
