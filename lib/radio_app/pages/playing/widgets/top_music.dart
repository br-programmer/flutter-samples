import 'package:flutter/material.dart';

class TopMusic extends StatelessWidget {
  const TopMusic({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top 20',
            style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            'Best Music',
            style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white70, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
