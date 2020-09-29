import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_parking/pages/home/widgets/widgets.dart' show EntryExit, Park, TextVertical;

class Parking extends StatelessWidget {
  const Parking({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [const Park(), const TextVertical(), const EntryExit()],
        ),
      ),
    );
  }
}
