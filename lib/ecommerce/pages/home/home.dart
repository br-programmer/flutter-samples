import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/ecommerce/pages/home/widgets/widgets.dart';
import 'package:flutter_samples/ecommerce/utils/constans.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: EcommerceColors.scaffold,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              Column(children: [const Header(), const _Body()]),
              const CustomButtonNavigation()
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          const SelectMore(text: 'Select Category', text1: 'view all'),
          Categories(),
          const Search(),
          const SelectMore(text: 'Hot sales', text1: 'see more'),
          const HotSales(),
          const SelectMore(text: 'Best Seller', text1: 'see more'),
          const GridBestSeller(),
        ],
      ),
    );
  }
}
