import 'package:flutter/material.dart';
import 'package:flutter_samples/ecommerce/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Name extends StatelessWidget {
  const Name({Key key, @required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: EcommerceColors.backgroundColor, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: EcommerceColors.backgroundColor, borderRadius: BorderRadius.circular(7.5)),
          padding: const EdgeInsets.all(10),
          child:
              Center(child: SvgPicture.asset('assets/images/ecommerce/favorite.svg', color: Colors.white, height: 15)),
        )
      ],
    );
  }
}
