import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/apps/super_cines_redesign/pages/home/widgets/widgets.dart';
import 'package:flutter_samples/apps/super_cines_redesign/utils/constans.dart';
import 'package:flutter_samples/apps/super_cines_redesign/widgets/footer.dart';
import 'package:flutter_samples/apps/super_cines_redesign/widgets/header.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Stack(
      fit: StackFit.expand,
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: SuperCinesColors.background.withOpacity(.7),
          body: Column(
            children: [const Header(), const Body(), const Footer()],
          ),
        ),
      ],
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [const DetailAndBuy(), const Movies()]),
    );
  }
}
