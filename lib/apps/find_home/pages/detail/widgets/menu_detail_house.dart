import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/find_home/models/select_house_menu.dart';
import 'package:flutter_samples/apps/find_home/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuDetailHouse extends StatelessWidget {
  MenuDetailHouse({Key key}) : super(key: key);

  final _index = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          children: [
            Divider(thickness: 2, color: Color(0xffECF1F6)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: selectHouseMenuItems.map(
                    (e) {
                      final index = selectHouseMenuItems.indexOf(e);
                      return ValueListenableBuilder<int>(
                          valueListenable: _index,
                          builder: (_, value, __) {
                            final isSelected = value == index;
                            return GestureDetector(
                              onTap: isSelected ? null : () => _index.value = index,
                              child: Material(
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    SvgPicture.asset(e.path,
                                        height: 25, color: isSelected ? FindHomeColors.cyan : null),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        e.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .button
                                            .copyWith(color: isSelected ? FindHomeColors.cyan : Color(0xffB7C1CA)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                  ).toList()),
            ),
            Divider(thickness: 2, color: Color(0xffECF1F6)),
          ],
        ),
      ),
    );
  }
}
