import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/find_home/pages/home/home.dart';
import 'package:flutter_samples/apps/find_home/pages/login/widgets/email_password.dart';
import 'package:flutter_samples/apps/find_home/utils/constans.dart';
import 'package:flutter_samples/apps/find_home/widgets/rounded_button.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({Key key}) : super(key: key);

  void _goToHome(BuildContext context) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Home()));

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrains) => Padding(
        padding: EdgeInsets.only(bottom: constrains.maxHeight * .1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Welcome',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: FindHomeColors.blue, fontWeight: FontWeight.w900)),
            Text('Login for enjoy findhome',
                textAlign: TextAlign.center,
                style:
                    Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.black26, fontWeight: FontWeight.w100)),
            const SizedBox(height: 30),
            EmailPassword(text: 'Email', placeHolder: 'brayancantosm07ci@gmail.com'),
            EmailPassword(text: 'Password', placeHolder: 'Brayan123456', isPassWord: true),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: RoundedButton(onPressed: () => _goToHome(context))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Forgot password?',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black54),
                ),
                Text(
                  'Create new account',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: FindHomeColors.blueDark, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
