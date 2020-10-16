import 'package:flutter/material.dart';
import 'package:flutter_samples/diet_fast/utils/constan.dart';

class Activity extends StatelessWidget {
  const Activity({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Activity',
                style:
                    Theme.of(context).textTheme.headline5.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
            const SizedBox(width: 15),
            RotatedBox(quarterTurns: 1, child: Icon(Icons.arrow_forward_ios)),
            Expanded(
              child: Text('Today, ${DateTime.now().day} ${months[DateTime.now().month - 1]} ${DateTime.now().year}',
                  style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.end),
            ),
          ],
        ),
      ),
    );
  }
}
