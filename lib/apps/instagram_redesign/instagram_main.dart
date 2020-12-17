import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/apps/instagram_redesign/models/navigation.dart';
import 'package:flutter_samples/apps/instagram_redesign/pages/pages.dart';
import 'package:flutter_samples/apps/instagram_redesign/widgets/widgets.dart';
import 'package:provider/provider.dart';

class InstagramMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Theme.of(context).brightness,
    ));
    return ChangeNotifierProvider(
      create: (_) => Navigation(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Consumer<Navigation>(
          builder: (_, navigation, __) => Stack(
            children: [
              IndexedStack(
                index: navigation.currentIndex,
                children: [HomePage(), SearchPage(), NewPage(), FavoritePage(), ProfilePage()],
              ),
              MyBottomNavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
}
