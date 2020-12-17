import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/nike_shoes/widgets/widgets.dart' show CounterChild;

class DetailTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipPath(
        clipper: ClipperDetail(),
        child: Container(
          color: Color(0xffEBEBE9),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 40,
                child: Image.asset('assets/images/nike_shoes/nike_shoes_shadow.jpg'),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(color: Color(0xffFCFCFC), shape: BoxShape.circle, boxShadow: [
                          BoxShadow(color: Colors.grey.withOpacity(.4), blurRadius: 20, spreadRadius: 10)
                        ]),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 12),
                                child: Text('360',
                                    style: TextStyle(fontSize: 9, color: Colors.black54, fontWeight: FontWeight.w700)),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Icon(Icons.threesixty, color: Colors.black54),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      CounterChild(color: Colors.black87),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ClipperDetail extends CustomClipper<Path> {
  ClipperDetail([this.border = 55]);
  final double border;
  @override
  Path getClip(Size size) => Path()
    ..moveTo(0, size.height * .8)
    ..lineTo(0, size.height)
    ..lineTo(size.width, size.height)
    ..lineTo(size.width, 0)
    ..lineTo(size.width * (this.border / 151), 0)
    ..quadraticBezierTo(size.width * (this.border / 331), 0, this.border, this.border - (this.border * .2))
    ..close();

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
