import 'package:flutter/material.dart';
import 'package:flutter_samples/diet_fast/pages/onboarding/onboarding.dart';
import 'package:google_fonts/google_fonts.dart';

class DietFast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(textTheme: GoogleFonts.openSansTextTheme()),
      home: OnBoarding(),
    );
  }
}
