import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/find_home/pages/login/widgets/widgets.dart';
import 'package:flutter_samples/find_home/utils/constans.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FindHomeColors.cyan,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
              child: Column(
                children: [const Header(), const Body()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(this);
    print(Theme.of(context).brightness);
    return Expanded(
      child: ClipPath(
        clipper: _BodyClipper(),
        child: Container(
          color: FindHomeColors.background,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FormLogin(),
        ),
      ),
    );
  }
}

class _BodyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..moveTo(size.width, size.height)
    ..lineTo(0, size.height)
    ..lineTo(0, size.height * .3)
    ..arcToPoint(Offset(size.width * .03, size.height * .25), radius: Radius.circular(40))
    ..lineTo(size.width * .4, size.height * .03)
    ..quadraticBezierTo(size.width * .45, 0, size.width * .5, 0)
    ..quadraticBezierTo(size.width * .55, 0, size.width * .6, size.height * .03)
    ..lineTo(size.width * .97, size.height * .25)
    ..arcToPoint(Offset(size.width, size.height * .3), radius: Radius.circular(50))
    ..lineTo(size.width, size.height)
    ..close();

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => oldClipper != this;
}
