import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_samples/find_home/models/select_category.dart';
import 'package:flutter_samples/find_home/utils/constans.dart';
import 'package:flutter_samples/widgets/sliver_header_delegate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchAndSelectCategory extends StatelessWidget {
  const SearchAndSelectCategory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      delegate: SliverCustomHeaderDelegate(
        maxHeight: 210,
        minHeight: 210,
        child: Container(
          color: FindHomeColors.background,
          padding: EdgeInsets.only(bottom: 20, top: 20),
          child: Column(
            children: [const _Search(), const SizedBox(height: 20), _SelectCategory()],
          ),
        ),
      ),
    );
  }
}

class _SelectCategory extends StatelessWidget {
  _SelectCategory({Key key}) : super(key: key);

  final _selected = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
            children: categories.map(
          (e) {
            final index = categories.indexOf(e);
            return Expanded(
              child: ValueListenableBuilder<int>(
                valueListenable: _selected,
                builder: (_, value, __) {
                  final isSelected = index == value;
                  return GestureDetector(
                    onTap: !isSelected ? () => _selected.value = index : null,
                    child: AnimatedContainer(
                      margin: EdgeInsets.only(left: 7.5, right: 7.5, bottom: isSelected ? 0 : 30),
                      duration: const Duration(milliseconds: 250),
                      decoration: BoxDecoration(
                        color: isSelected ? FindHomeColors.cyan : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(.075), blurRadius: 7.5)],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(e.path, width: 35, color: isSelected ? Colors.white : Colors.black12),
                          if (isSelected)
                            Padding(
                              padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
                              child: Text(e.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ).toList()),
      ),
    );
  }
}

class _Search extends StatelessWidget {
  const _Search({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/images/find_home/search-home.svg'),
          Expanded(
            child: CupertinoTextField(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(),
              placeholder: 'What are you looking for?',
              placeholderStyle: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: FindHomeColors.searchColor, fontWeight: FontWeight.w100),
              cursorColor: FindHomeColors.searchColor,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: FindHomeColors.searchColor, fontWeight: FontWeight.w100),
            ),
          ),
          RotatedBox(quarterTurns: 1, child: Icon(FontAwesome.sliders, color: FindHomeColors.blueDark)),
        ],
      ),
    );
  }
}
