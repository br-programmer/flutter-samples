import 'package:flutter/material.dart';
import 'package:flutter_samples/nike_shoes/pages/detail/widgets/widgets.dart' show CardListImage;
import 'package:flutter_samples/nike_shoes/utils/constans.dart';

class NewAndListImages extends StatelessWidget {
  const NewAndListImages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Row(
          children: [
            ClipPath(
              clipper: ClipperNew(),
              child: Container(
                decoration: BoxDecoration(color: NikeShoesColors.orangeNew),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text(
                  'new',
                  style: TextStyle(fontFamily: 'Uniwars', fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 95,
                child: ListView.builder(
                  itemCount: photosNike.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 110),
                  itemBuilder: (_, i) => CardListImage(path: photosNike[i]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ClipperNew extends CustomClipper<Path> {
  @override
  getClip(Size size) => Path()
    ..moveTo(0, size.height - 3)
    ..quadraticBezierTo(0, size.height, 3, size.height)
    ..lineTo(size.width * .9, size.height)
    ..quadraticBezierTo(size.width * .95, size.height, size.width * .95, size.height - 3)
    ..lineTo(size.width, 3)
    ..quadraticBezierTo(size.width, 0, size.width - 3, 0)
    ..lineTo(7, 0)
    ..quadraticBezierTo(3, 0, 3, 3)
    ..close();

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
