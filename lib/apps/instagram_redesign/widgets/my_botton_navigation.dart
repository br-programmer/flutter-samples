import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_samples/apps/instagram_redesign/models/navigation.dart';
import 'package:flutter_samples/apps/instagram_redesign/utils/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MyBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: kBottomNavigationBarHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Consumer<Navigation>(
          builder: (_, navigation, __) => Stack(
            overflow: Overflow.visible,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  items.length,
                  (i) => CupertinoButton(
                    child: (i == 4)
                        ? CircleAvatar(
                            radius: 11,
                            backgroundColor: (navigation.currentIndex == i) ? InstagramColors.pink : Colors.transparent,
                            child: CircleAvatar(radius: 9, backgroundImage: AssetImage(items[i])),
                          )
                        : (i == 2)
                            ? SizedBox.shrink()
                            : SvgPicture.asset(items[i],
                                color: navigation.currentIndex == i ? InstagramColors.pink : InstagramColors.grey),
                    onPressed: () => (i != 2) ? navigation.currentIndex = i : null,
                  ),
                ),
              ),
              Positioned(
                left: (MediaQuery.of(context).size.width / 2) - (sizeLogo / 2),
                right: (MediaQuery.of(context).size.width / 2) - (sizeLogo / 2),
                top: -30,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => navigation.currentIndex = 2,
                  child: Container(
                    height: sizeLogo,
                    width: sizeLogo,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                          colors: [InstagramColors.purple, InstagramColors.pink, InstagramColors.orange],
                          stops: [.1, .5, 1]),
                    ),
                    padding: EdgeInsets.all(15),
                    child: SvgPicture.asset(items[2]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
