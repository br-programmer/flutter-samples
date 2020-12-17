import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/instagram_redesign/utils/constant.dart';
import 'package:flutter_samples/apps/widgets/sliver_header_delegate.dart' show SliverCustomHeaderDelegate;
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatelessWidget {
  const Search({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      delegate: SliverCustomHeaderDelegate(
        minHeight: 80,
        maxHeight: 80,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/instagram_redesign/search.svg',
                    width: 25,
                    color: InstagramColors.grey,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CupertinoTextField(
                      decoration: BoxDecoration(),
                      cursorColor: Theme.of(context).hintColor,
                      maxLines: 1,
                      placeholder: 'Buscar',
                      style: Theme.of(context).textTheme.subtitle1,
                      placeholderStyle: Theme.of(context).textTheme.subtitle1.copyWith(color: InstagramColors.grey),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SvgPicture.asset(
                    'assets/images/instagram_redesign/qr.svg',
                    width: 25,
                    color: Theme.of(context).canvasColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
