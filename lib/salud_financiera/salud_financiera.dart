import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/salud_financiera/bloc/blocs.dart';
import 'package:flutter_samples/salud_financiera/pages/splash/splash.dart';
import 'package:provider/provider.dart';

class SaludFinaciera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashBLoC()),
        ChangeNotifierProvider(create: (_) => OnBoardingBLoC()),
        ChangeNotifierProvider(create: (_) => HealthBLoC()),
        ChangeNotifierProvider(create: (_) => HomeBLoC()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Aeonik'),
        home: Splash(),
      ),
    );
  }
}
