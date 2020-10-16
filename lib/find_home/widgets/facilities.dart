import 'package:flutter/material.dart';
import 'package:flutter_samples/find_home/models/house.dart';
import 'package:flutter_samples/find_home/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Facilities extends StatelessWidget {
  const Facilities({Key key, @required this.house, this.isDetail = false}) : super(key: key);

  final House house;
  final bool isDetail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Facilitie(path: 'assets/images/find_home/bedroom.svg', name: house.bedroom.toString(), isDetail: isDetail),
        Facilitie(path: 'assets/images/find_home/bathroom.svg', name: house.bathroom.toString(), isDetail: isDetail),
        Facilitie(path: 'assets/images/find_home/menu.svg', name: house.menu.toString(), isDetail: isDetail),
      ],
    );
  }
}

class Facilitie extends StatelessWidget {
  const Facilitie({Key key, @required this.path, @required this.name, this.isDetail}) : super(key: key);

  final String path;
  final String name;
  final bool isDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: !isDetail ? const EdgeInsets.only(left: 5) : const EdgeInsets.only(right: 25),
      child: Row(
        children: [
          SvgPicture.asset(path,
              width: !isDetail ? 20 : 30, color: !isDetail ? FindHomeColors.searchColor : FindHomeColors.cyan),
          Padding(
            padding: EdgeInsets.only(left: !isDetail ? 2.5 : 7.5),
            child: Text(
              name,
              style: !isDetail
                  ? Theme.of(context).textTheme.subtitle2.copyWith(color: FindHomeColors.searchColor)
                  : Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: FindHomeColors.searchColor, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
