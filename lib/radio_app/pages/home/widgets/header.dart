import 'package:flutter/material.dart';
import 'package:flutter_samples/radio_app/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({Key key, this.isPlaying = false}) : super(key: key);

  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isPlaying)
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: RotatedBox(quarterTurns: 2, child: SvgPicture.asset('assets/images/radio_app/next.svg')),
            ),
          )
        else
          RichText(
            text: TextSpan(
              text: 'Hello',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              children: [
                WidgetSpan(child: const SizedBox(width: 5)),
                TextSpan(
                  text: 'Brayan',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: RadioAppColors.redPurple, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        Spacer(),
        const MyAvatar(),
      ],
    );
  }
}

class MyAvatar extends StatelessWidget {
  const MyAvatar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: ClipPath(
        clipper: _AvatarClipper(),
        child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/brayan.jpg'), fit: BoxFit.cover))),
      ),
    );
  }
}

class _AvatarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..moveTo(0, size.height * 0.26)
    ..lineTo(0, size.height * 0.66)
    ..quadraticBezierTo(0, size.height * .78, size.width * .1, size.height * .9)
    ..cubicTo(
        size.width * .17, size.height * .96, size.width * .28, size.height * .99, size.width * .34, size.height * .99)
    ..quadraticBezierTo(size.width * .4, size.height * .98, size.width * .48, size.height * .95)
    ..lineTo(size.width * .74, size.height * .8)
    ..quadraticBezierTo(size.width * .87, size.height * .75, size.width * .93, size.height * .67)
    ..cubicTo(
        size.width * .97, size.height * .63, size.width * .99, size.height * .52, size.width * .99, size.height * .46)
    ..cubicTo(
        size.width * .98, size.height * .33, size.width * .92, size.height * .28, size.width * .87, size.height * .24)
    ..cubicTo(
        size.width * .8, size.height * .2, size.width * .57, size.height * .075, size.width * 0.49, size.height * .025)
    ..cubicTo(size.width * .46, size.height * .03, size.width * .43, 0, size.width * 0.34, 0)
    ..cubicTo(size.width * .25, 0, size.width * .17, size.height * .02, size.width * .1, size.height * .09)
    ..quadraticBezierTo(size.width * .02, size.height * .16, 0, size.height * .26)
    ..close();

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => oldClipper != this;
}
