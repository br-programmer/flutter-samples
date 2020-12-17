import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/ecommerce/utils/constans.dart';

class InfoSelect extends StatelessWidget {
  const InfoSelect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
          children: info
              .map(
                (e) => Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: (info.indexOf(e) == 0)
                            ? Border(bottom: BorderSide(color: EcommerceColors.orange, width: 2.5))
                            : Border()),
                    alignment: Alignment.center,
                    child: Text(
                      e,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: (info.indexOf(e) == 0) ? EcommerceColors.backgroundColor : Colors.black54,
                            fontWeight: (info.indexOf(e) == 0) ? FontWeight.bold : FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              )
              .toList()),
    );
  }
}
