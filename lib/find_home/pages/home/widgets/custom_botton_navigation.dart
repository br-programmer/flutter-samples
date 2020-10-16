import 'package:flutter/material.dart';
import 'package:flutter_samples/find_home/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottonNavigation extends StatelessWidget {
  CustomBottonNavigation({Key key}) : super(key: key);

  final _selected = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: kBottomNavigationBarHeight * 1.25,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Row(
          children: itemsBottonNavigation.map(
            (e) {
              final index = itemsBottonNavigation.indexOf(e);
              return ValueListenableBuilder<int>(
                valueListenable: _selected,
                builder: (_, value, __) => Expanded(
                  child: GestureDetector(
                    onTap: (index == value) ? null : () => _selected.value = index,
                    child: Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: SvgPicture.asset(e,
                            width: (index > 1) ? 22 : 25,
                            color: (index == value) ? FindHomeColors.cyan : Colors.black26),
                      ),
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
