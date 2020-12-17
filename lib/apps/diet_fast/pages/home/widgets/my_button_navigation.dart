import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/diet_fast/models/boton_navigation.dart';
import 'package:flutter_samples/apps/diet_fast/utils/constan.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyButtonNavigation extends StatelessWidget {
  MyButtonNavigation({Key key}) : super(key: key);
  final indexSelected = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: kBottomNavigationBarHeight * 1.2,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 7, offset: Offset(0, -1.5)),
          ],
        ),
        child: ValueListenableBuilder<int>(
          valueListenable: indexSelected,
          builder: (_, select, __) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: itemsNavigation.map(
              (item) {
                final index = itemsNavigation.indexOf(item);
                final isSelected = select == index;
                return GestureDetector(
                  onTap: () => indexSelected.value = index,
                  child: ItemButonNavigation(isSelected: isSelected, buttonNavigation: item),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}

class ItemButonNavigation extends StatelessWidget {
  const ItemButonNavigation({Key key, @required this.isSelected, @required this.buttonNavigation}) : super(key: key);
  final bool isSelected;
  final ButtonNavigation buttonNavigation;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isSelected ? 130 : 50,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? DietFastColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: SvgPicture.asset(buttonNavigation.path, color: isSelected ? Colors.white : Colors.black26),
            ),
            if (isSelected)
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: DefaultTextStyle.merge(
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    child: Text(buttonNavigation.title),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
