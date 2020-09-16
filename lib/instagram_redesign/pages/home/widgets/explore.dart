import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/instagram_redesign/pages/search/widgets/widgets.dart' show SliverCustomHeaderDelegate;
import 'package:flutter_svg/flutter_svg.dart';

class Explore extends StatelessWidget {
  const Explore({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      delegate: SliverCustomHeaderDelegate(
        minHeight: 60,
        maxHeight: 70,
        child: Container(
          height: 60,
          color: Theme.of(context).scaffoldBackgroundColor,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explorar',
                style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Theme.of(context).cardColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    SvgPicture.asset('assets/images/instagram_redesign/search.svg',
                        color: Theme.of(context).accentColor),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CupertinoTextField(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        style: Theme.of(context).textTheme.subtitle1.copyWith(),
                        cursorColor: Theme.of(context).hintColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
