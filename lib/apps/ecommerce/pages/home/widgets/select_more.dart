import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/ecommerce/utils/constans.dart';

class SelectMore extends StatelessWidget {
  const SelectMore({Key key, @required this.text, @required this.text1}) : super(key: key);
  final String text;
  final String text1;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: EcommerceColors.backgroundColor, fontWeight: FontWeight.w700),
              ),
            ),
            Text(text1, style: Theme.of(context).textTheme.bodyText2.copyWith(color: EcommerceColors.orange)),
          ],
        ),
      ),
    );
  }
}
