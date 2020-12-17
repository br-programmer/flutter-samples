import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/ecommerce/models/phone.dart';
import 'package:flutter_samples/apps/ecommerce/utils/constans.dart';

class ColorAndCapacity extends StatelessWidget {
  const ColorAndCapacity({Key key, @required this.phone}) : super(key: key);

  final Phone phone;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: phone.colors
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(top: 15, right: 15),
                    child: CircleAvatar(
                      backgroundColor: e,
                      radius: 22,
                      child:
                          (phone.colors.indexOf(e) == 0) ? Icon(Icons.check, color: Colors.white) : SizedBox.shrink(),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: Row(
            children: phone.capacities
                .map(
                  (e) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
                        decoration: BoxDecoration(
                          color: (phone.capacities.indexOf(e) == 0) ? EcommerceColors.orange : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text('$e GB',
                            style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: (phone.capacities.indexOf(e) == 0) ? Colors.white : Colors.black38,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
