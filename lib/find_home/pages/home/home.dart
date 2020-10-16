import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/find_home/pages/home/widgets/widgets.dart';
import 'package:flutter_samples/find_home/utils/constans.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: FindHomeColors.background,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [Body(), CustomBottonNavigation()],
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [const Header(), const SearchAndSelectCategory(), const ListHouse()],
      ),
    );
  }
}
