import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/radio_app/pages/home/home.dart';
import 'package:flutter_samples/radio_app/pages/sign_up/widgets/input_phone.dart';
import 'package:flutter_samples/radio_app/utils/constans.dart';
import 'package:flutter_svg/svg.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/radio_app/1.png'), fit: BoxFit.cover))),
            ),
            const _Body(),
            Positioned(
              top: MediaQuery.of(context).size.height * .175,
              child: ClipPath(
                clipper: _ClipperSignUp(),
                child: Container(
                    color: RadioAppColors.redPurple,
                    height: MediaQuery.of(context).size.height * .25,
                    width: MediaQuery.of(context).size.width),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(color: RadioAppColors.blueDark.withOpacity(.5)),
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/radio_app/radio-app-logo.svg'),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sign up',
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 3)),
                  const SizedBox(height: 10),
                  Text('to start play',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white, fontWeight: FontWeight.w500))
                ],
              ),
              const SizedBox(height: 35),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Phone Number',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.white, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 10),
                  const InputPhone(),
                ],
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Home())),
                child: Container(
                  color: RadioAppColors.blueLight,
                  padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                  child: SvgPicture.asset('assets/images/radio_app/next.svg'),
                ),
              ),
              const SizedBox(height: 20),
              Text('Or Sign In',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.white, fontWeight: FontWeight.normal))
            ],
          ),
        ),
      ),
    );
  }
}

class _ClipperSignUp extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..moveTo(size.width, 0)
    ..lineTo(size.width, size.height)
    ..lineTo(size.width * .7, size.height * .35)
    ..quadraticBezierTo(size.width * .63, size.height * .22, size.width * .68, size.height * .15)
    ..quadraticBezierTo(size.width * .68, size.height * .15, size.width * .725, size.height * .12)
    ..close();

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => oldClipper != this;
}
