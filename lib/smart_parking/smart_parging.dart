import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/smart_parking/pages/home/smart_parking_home.dart';
import 'package:google_fonts/google_fonts.dart';

class SmartParking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      home: SmartParkingHome(),
    );
  }
}
