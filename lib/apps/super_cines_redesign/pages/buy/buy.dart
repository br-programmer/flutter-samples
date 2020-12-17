import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/super_cines_redesign/pages/buy/widgets/widgets.dart';
import 'package:flutter_samples/apps/super_cines_redesign/utils/constans.dart';
import 'package:flutter_samples/apps/super_cines_redesign/widgets/footer.dart';
import 'package:flutter_samples/apps/super_cines_redesign/widgets/header.dart';

class Buy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SuperCinesColors.blue,
      body: Column(
        children: [const Header(), const Body(), Footer(isBuy: true, onTap: () => Navigator.pop(context))],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [const ImageAndTitle(), Date(), Time(), const Screen(), Chairs()],
      ),
    );
  }
}
