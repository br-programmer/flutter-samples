import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/smart_parking/models/selection.dart';

class SelectionFloor extends StatelessWidget {
  SelectionFloor({Key key}) : super(key: key);
  final _selected = ValueNotifier<int>(2);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        selections.length,
        (i) => Expanded(
          child: ValueListenableBuilder<int>(
            valueListenable: _selected,
            builder: (_, select, __) => CupertinoButton(
              onPressed: () => _selected.value = i,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 12.5),
                decoration: BoxDecoration(
                  color: selections[i].color.withOpacity((select == i) ? 1.0 : 0.15),
                  borderRadius: BorderRadius.circular(7.5),
                ),
                child: Text(
                  selections[i].tittle,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: (select == i) ? Colors.white : selections[i].color,
                        fontWeight: FontWeight.bold,
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
