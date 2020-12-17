import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_samples/apps/find_home/pages/account/widgets/widgets.dart';
import 'package:flutter_samples/apps/find_home/pages/home/widgets/list_house.dart';
import 'package:flutter_samples/apps/find_home/utils/constans.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [const DataUser(), const Body()],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          child: Container(
            padding: EdgeInsets.only(top: 20),
            color: FindHomeColors.background,
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                const FindHomeTitle(),
                const ListFindHome(),
                const PostTitle(),
                const ListHouse(isAccount: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
