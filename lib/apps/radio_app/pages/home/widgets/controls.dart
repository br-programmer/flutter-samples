import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/radio_app/clippers/control_polygon.dart';
import 'package:flutter_samples/apps/radio_app/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Controls extends StatelessWidget {
  const Controls({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: AspectRatio(
        aspectRatio: 16 / 7,
        child: LayoutBuilder(
          builder: (context, constrains) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NextPrevius(rotation: 1, size: constrains.maxHeight * .45),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ButtonPlay(size: constrains.maxHeight * .7),
                    BorderPlay(size: constrains.maxHeight, color: RadioAppColors.redPurple),
                    BorderPlay(size: constrains.maxHeight * .85, color: RadioAppColors.blueLight),
                  ],
                ),
                NextPrevius(rotation: 3, size: constrains.maxHeight * .45),
              ],
            );
          },
        ),
      ),
    );
  }
}

class NextPrevius extends StatelessWidget {
  const NextPrevius({Key key, this.rotation, this.size}) : super(key: key);
  final int rotation;
  final double size;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: ControlPolygon(
        color: RadioAppColors.blueAccent,
        borderRadius: 10,
        child: Container(
          width: size,
          height: size,
          padding: EdgeInsets.all(size / 3),
          alignment: Alignment.center,
          child: RotatedBox(quarterTurns: rotation, child: SvgPicture.asset('assets/images/radio_app/play.svg')),
        ),
      ),
    );
  }
}

class ButtonPlay extends StatelessWidget {
  const ButtonPlay({Key key, this.size}) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: ControlPolygon(
        color: RadioAppColors.redPurple,
        borderRadius: 8,
        child: Container(
          width: size,
          height: size,
          padding: EdgeInsets.all(18),
          alignment: Alignment.center,
          child: RotatedBox(quarterTurns: 3, child: SvgPicture.asset('assets/images/radio_app/play.svg')),
        ),
      ),
    );
  }
}

class BorderPlay extends StatelessWidget {
  const BorderPlay({Key key, this.size, this.color}) : super(key: key);
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: ControlPolygon(
        color: color,
        paintingStyle: PaintingStyle.stroke,
        borderRadius: 8,
        child: SizedBox(width: size, height: size),
      ),
    );
  }
}
