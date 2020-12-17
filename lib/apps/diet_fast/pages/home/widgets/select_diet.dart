import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/diet_fast/utils/constan.dart';

class SelectDiet extends StatelessWidget {
  SelectDiet({
    Key key,
  }) : super(key: key);

  final indexSelected = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: ValueListenableBuilder<int>(
          valueListenable: indexSelected,
          builder: (_, select, __) => Row(
            children: List.generate(
              diets.length,
              (index) => Expanded(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  pressedOpacity: 1,
                  onPressed: () => indexSelected.value = index,
                  child: Container(
                    width: double.infinity,
                    color: (index == select) ? DietFastColors.primary : Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      diets[index],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: (index == select) ? Colors.white : Colors.black,
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
