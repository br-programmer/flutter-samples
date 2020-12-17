import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/smart_parking/pages/review/widgets/widgets.dart' show ReviewDetail;
import 'package:flutter_samples/apps/smart_parking/widgets/widgets.dart' show MyCustomAppBar;

class ReviewParking extends StatelessWidget {
  const ReviewParking({Key key}) : super(key: key);
  void _back(BuildContext context) => Navigator.pop(context);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
        child: Column(
          children: [
            MyCustomAppBar(text: 'Review Summary', isReview: true, onTap: () => _back(context)),
            const ReviewDetail(),
          ],
        ),
      ),
    );
  }
}
