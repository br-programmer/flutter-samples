import 'package:flutter/material.dart';
import 'package:flutter_samples/space_concept/models/on_boarding.dart';
import 'package:flutter_samples/space_concept/models/on_boarding_navigation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Info extends StatelessWidget {
  const Info({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<OnBoardingNavigation>(
        builder: (_, navigation, __) => PageView.builder(
            controller: navigation.pageController,
            physics: NeverScrollableScrollPhysics(),
            itemCount: itemsOnBoarding.length,
            itemBuilder: (_, i) => ItemInfo(onBoarding: itemsOnBoarding[i])),
      ),
    );
  }
}

class ItemInfo extends StatelessWidget {
  const ItemInfo({Key key, @required this.onBoarding}) : super(key: key);
  final OnBoarding onBoarding;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(child: Transform.translate(offset: Offset(20, 0), child: SvgPicture.asset(onBoarding.path))),
        const SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      onBoarding.title.split(' ')[0],
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: -.5),
                    ),
                    Text(
                      onBoarding.title.split(' ')[1],
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.black, fontWeight: FontWeight.w300, letterSpacing: 2),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      onBoarding.info,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(width: size.width * .18),
              Icon(Icons.arrow_forward_ios, size: 40),
            ],
          ),
        )
      ],
    );
  }
}
