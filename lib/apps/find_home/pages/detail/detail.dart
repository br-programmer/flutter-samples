import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/find_home/models/house.dart';
import 'package:flutter_samples/apps/find_home/pages/detail/widgets/widgets.dart';
import 'package:flutter_samples/apps/find_home/utils/constans.dart';
import 'package:flutter_samples/apps/find_home/widgets/facilities.dart';

class Detail extends StatelessWidget {
  const Detail({Key key, @required this.house}) : super(key: key);
  final House house;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PhotosHouse(photos: house.photos, aviable: house.aviable),
          InfoHouse(house: house),
        ],
      ),
    );
  }
}

class InfoHouse extends StatelessWidget {
  const InfoHouse({Key key, this.house}) : super(key: key);
  final House house;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: MediaQuery.of(context).size.height * .45,
      child: Hero(
        tag: house.name,
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          child: Container(
            color: FindHomeColors.background,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: kBottomNavigationBarHeight * 2),
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: [
                      HeaderDetailHouse(house: house),
                      Utilities(utilities: house.utilities),
                      SliverToBoxAdapter(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                              child: Facilities(house: house, isDetail: true))),
                      MenuDetailHouse(),
                      Information(description: house.description),
                    ],
                  ),
                ),
                PriceReserved(price: house.price),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
