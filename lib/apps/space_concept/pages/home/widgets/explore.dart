import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/space_concept/pages/home/widgets/rounded.dart';

class Explore extends StatelessWidget {
  const Explore({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Rounded(text: '3'),
              const SizedBox(width: 10),
              Text('Explore',
                  style:
                      Theme.of(context).textTheme.headline4.copyWith(color: Colors.white, fontWeight: FontWeight.bold))
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Habitant sem ut sit fames in adipiscing. Ac magna donec egestas habitant.',
            style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white, fontWeight: FontWeight.w300),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
