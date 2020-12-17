import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/salud_financiera/models/movement.dart';
import 'package:flutter_samples/apps/salud_financiera/utils/constans.dart';
import 'package:intl/intl.dart';

class ListMovement extends StatelessWidget {
  const ListMovement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate:
          SliverChildBuilderDelegate((_, i) => _ItemMovement(movement: movements[i]), childCount: movements.length),
    );
  }
}

class _ItemMovement extends StatelessWidget {
  const _ItemMovement({Key key, this.movement}) : super(key: key);
  final Movement movement;

  @override
  Widget build(BuildContext context) {
    final isNegative = movement.value < 0;
    String value = NumberFormat.currency(locale: 'en_US', decimalDigits: 2, symbol: '\$').format(movement.value);
    if (!isNegative) value = '+$value';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 10)],
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(color: SaludFinacieraColors.primary, shape: BoxShape.circle),
              padding: const EdgeInsets.all(12.5),
              alignment: Alignment.center,
              child: Text('${movement.date.split(' ')[0]}\n${movement.date.split(' ')[1]}',
                  textAlign: TextAlign.center,
                  style:
                      Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.w600, color: Colors.white)),
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Text(movement.name,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(color: SaludFinacieraColors.blue),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis))),
            Text(value,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: isNegative ? SaludFinacieraColors.red : Color(0xFF38BC68))),
          ],
        ),
      ),
    );
  }
}
