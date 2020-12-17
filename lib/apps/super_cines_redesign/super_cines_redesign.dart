import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/super_cines_redesign/models/movie_bloc.dart';
import 'package:flutter_samples/apps/super_cines_redesign/pages/home/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SuperCinesRedesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MovieBLoC(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.interTextTheme(),
        ),
        home: Home(),
      ),
    );
  }
}
