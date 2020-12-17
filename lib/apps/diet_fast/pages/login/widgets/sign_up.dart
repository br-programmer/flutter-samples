import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account? ",
            style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black45),
          ),
          Text('sign up',
              style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
