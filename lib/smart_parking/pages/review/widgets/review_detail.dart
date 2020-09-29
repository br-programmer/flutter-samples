import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_parking/pages/review/widgets/widgets.dart'
    show PriceForTime, DistanceAndRating, Detail;

class ReviewDetail extends StatelessWidget {
  const ReviewDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 15),
          const PriceForTime(),
          Text('Easkarton Shopping Mall',
              style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const DistanceAndRating(),
          const SizedBox(height: 10),
          const Divider(thickness: .5),
          const Detail(),
        ],
      ),
    );
  }
}
