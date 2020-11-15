import 'package:flutter/material.dart';
import 'package:flutter_samples/diet_fast/pages/onboarding/onboarding.dart';
import 'package:flutter_samples/diet_fast/bloc/page_view_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DietFast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PageViewBLoC(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(textTheme: GoogleFonts.openSansTextTheme()),
        home: OnBoarding(),
      ),
    );
  }
}
