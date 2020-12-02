import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/instagram_redesign/utils/constant.dart';
import 'package:flutter_samples/widgets/sliver_header_delegate.dart';

class SelectCategory extends StatelessWidget {
  final _selected = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverCustomHeaderDelegate(
        maxHeight: 60,
        minHeight: 60,
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              selectCategory.length,
              (i) => ValueListenableBuilder(
                valueListenable: _selected,
                builder: (_, value, __) => CupertinoButton(
                  padding: EdgeInsets.zero,
                  pressedOpacity: 1,
                  onPressed: () => _selected.value = i,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 5, left: 20, right: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: (i == value) ? InstagramColors.pink : Colors.transparent, width: 2.5),
                      ),
                    ),
                    child: Text(
                      selectCategory[i],
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: (i == value) ? null : Theme.of(context).dividerColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
