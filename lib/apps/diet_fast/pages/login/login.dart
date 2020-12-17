import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/diet_fast/pages/login/widgets/widgets.dart';
import 'package:flutter_samples/apps/diet_fast/utils/constan.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: DietFastColors.background,
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: [const HeaderFooter(), const Form(), const HeaderFooter(isHeader: false)],
        ),
      ),
    );
  }
}

class Form extends StatelessWidget {
  const Form({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Welcome(),
                Input(),
                Input(isPass: true),
                const ForgotPass(),
                const ButonLogin(),
                const SignUp(),
                const ButtonsRedes(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
