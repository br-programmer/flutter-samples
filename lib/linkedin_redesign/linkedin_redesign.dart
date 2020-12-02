import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/linkedin_redesign/bloc/home_bloc.dart';
import 'package:flutter_samples/linkedin_redesign/pages/home/home_page.dart';
import 'package:flutter_samples/linkedin_redesign/utils/linkedin_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LinkedInRedesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return ChangeNotifierProvider(
      create: (_) => HomeBLoC(),
      child: MaterialApp(
        title: 'LinkedIn',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light()
            .copyWith(textTheme: GoogleFonts.montserratTextTheme(), scaffoldBackgroundColor: LinkedInColors.background),
        home: HomePage(),
      ),
    );
  }
}
