import 'package:flutter/material.dart';
import 'package:flutter_samples/find_home/models/house.dart';
import 'package:flutter_samples/find_home/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderDetailHouse extends StatelessWidget {
  const HeaderDetailHouse({Key key, @required this.house}) : super(key: key);

  final House house;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: SvgPicture.asset('assets/images/find_home/location.svg', width: 20),
                        ),
                        WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(house.user.location,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(color: FindHomeColors.blueDark)))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      house.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: FindHomeColors.blueDark, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            CircleAvatar(radius: 30, backgroundImage: AssetImage(house.user.photo)),
          ],
        ),
      ),
    );
  }
}
