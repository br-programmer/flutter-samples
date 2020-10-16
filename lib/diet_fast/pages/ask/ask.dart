import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/diet_fast/models/ask_model.dart';
import 'package:flutter_samples/diet_fast/pages/ask/widgets/widgets.dart';
import 'package:flutter_samples/diet_fast/utils/constan.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AskIndex(),
      child: Scaffold(
        backgroundColor: DietFastColors.background,
        body: Stack(children: [const Header(), const Content()]),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset('assets/images/diet_fast/ask.svg', height: 200),
          const TitleAsk(),
          const Questions(),
          const IndexAndNext(),
        ],
      ),
    );
  }
}
