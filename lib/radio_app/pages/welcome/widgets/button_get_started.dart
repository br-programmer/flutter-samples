import 'package:flutter/material.dart';
import 'package:flutter_samples/radio_app/pages/sign_up/sign_up.dart';
import 'package:flutter_samples/radio_app/utils/constans.dart';

class ButtonGetStarted extends StatelessWidget {
  const ButtonGetStarted({Key key}) : super(key: key);

  void _goToSignUp(BuildContext context) =>
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SignUp()));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToSignUp(context),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(color: RadioAppColors.redPurple, borderRadius: BorderRadius.circular(12)),
        alignment: Alignment.center,
        child: Text('Get Started',
            style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white, fontWeight: FontWeight.w500)),
      ),
    );
  }
}
