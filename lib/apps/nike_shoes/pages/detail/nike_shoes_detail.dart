import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/nike_shoes/pages/detail/widgets/widgets.dart' show Content, NewAndListImages;
import 'package:flutter_samples/apps/nike_shoes/utils/constans.dart';

class NikeShoesDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NikeShoesColors.colorGreen,
      body: Stack(
        children: [const Content(), const NewAndListImages()],
      ),
    );
  }
}
