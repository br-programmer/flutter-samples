import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/apps/ecommerce/bloc/page_view_bloc.dart';
import 'package:flutter_samples/apps/ecommerce/bloc/splash_bloc.dart';
import 'package:flutter_samples/apps/ecommerce/pages/splash/splash.dart';
import 'package:provider/provider.dart';

class Ecommerce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashBLoC()),
        ChangeNotifierProvider(create: (_) => PageViewBLoC()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}
