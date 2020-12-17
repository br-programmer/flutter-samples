import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/find_home/utils/constans.dart';

class Information extends StatelessWidget {
  const Information({Key key, @required this.description}) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Information',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: FindHomeColors.blueDark, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              description,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.black38, fontWeight: FontWeight.w100),
            ),
          )
        ],
      ),
    ));
  }
}
