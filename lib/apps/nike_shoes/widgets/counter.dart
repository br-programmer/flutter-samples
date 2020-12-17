import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/nike_shoes/utils/constans.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * .72,
      right: 0,
      child: CounterChild(),
    );
  }
}

class CounterChild extends StatelessWidget {
  const CounterChild({Key key, this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                '02',
                style: TextStyle(
                  fontFamily: 'Uniwars',
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: this.color,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '-',
                style: TextStyle(
                  fontFamily: 'Uniwars',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: NikeShoesColors.colorGreen,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Dot(),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Dot(),
            ),
          ],
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xff57585A).withOpacity(.5), shape: BoxShape.circle),
      width: 5,
      height: 5,
    );
  }
}
