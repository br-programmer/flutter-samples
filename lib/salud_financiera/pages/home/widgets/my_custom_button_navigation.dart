import 'package:flutter/material.dart';
import 'package:flutter_samples/salud_financiera/models/botton_navigation.dart';
import 'package:flutter_samples/salud_financiera/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCustomButtomNavigation extends StatelessWidget {
  MyCustomButtomNavigation({Key key}) : super(key: key);

  final _index = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: kToolbarHeight * 1.25,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: itemsNavigation
              .map(
                (e) => ValueListenableBuilder(
                    valueListenable: _index,
                    builder: (_, index, __) {
                      final isSelected = index == itemsNavigation.indexOf(e);
                      return GestureDetector(
                        onTap: () => _index.value = itemsNavigation.indexOf(e),
                        child: Row(
                          children: [
                            SvgPicture.asset(e.path, color: isSelected ? SaludFinacieraColors.primary : Colors.black12),
                            const SizedBox(width: 15),
                            if (isSelected)
                              Text(
                                e.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(color: SaludFinacieraColors.primary, fontWeight: FontWeight.w400),
                              ),
                          ],
                        ),
                      );
                    }),
              )
              .toList(),
        ),
      ),
    );
  }
}
