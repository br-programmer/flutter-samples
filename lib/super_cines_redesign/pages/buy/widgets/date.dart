import 'package:flutter/material.dart';
import 'package:flutter_samples/super_cines_redesign/utils/constans.dart';
import 'package:intl/intl.dart';

class Date extends StatelessWidget {
  Date({Key key}) : super(key: key);

  final _dateSelected = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: AspectRatio(
        aspectRatio: 16 / 3.65,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(color: SuperCinesColors.blueBlack),
          child: ValueListenableBuilder<int>(
            valueListenable: _dateSelected,
            builder: (_, dateSelected, __) => ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              padding: const EdgeInsets.only(left: 15),
              itemBuilder: (_, i) {
                final date = today.add(Duration(days: i));
                return GestureDetector(
                  onTap: () => _dateSelected.value = i,
                  child: ItemDate(
                      isSelected: dateSelected == i,
                      text: DateFormat('dd').format(date),
                      text2: DateFormat('E').format(date)),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ItemDate extends StatelessWidget {
  const ItemDate({Key key, this.isSelected = false, this.text, this.text2}) : super(key: key);
  final bool isSelected;
  final String text;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? SuperCinesColors.yellow : SuperCinesColors.gradient,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text ?? '10',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: isSelected ? Colors.black : Colors.white, fontWeight: FontWeight.w700),
          ),
          Text(
            text2.substring(0, 2).toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .button
                .copyWith(color: isSelected ? Colors.black54 : Colors.white38, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
