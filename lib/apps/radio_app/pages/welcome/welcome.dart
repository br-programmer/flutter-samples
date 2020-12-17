import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/radio_app/pages/welcome/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [const Background(), const _Body()],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.center, child: SvgPicture.asset('assets/images/radio_app/radio-app-slogan.svg')),
            SizedBox(height: size.height * .07),
            Text('Let’s Get \nStarted',
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 3)),
            SizedBox(height: size.height * .03),
            Text("Enjoy the best radio stations \nfrom your home, don't miss \nout on anything",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Colors.white.withOpacity(.6), fontWeight: FontWeight.w500)),
            const Spacer(),
            const ButtonGetStarted(),
            SizedBox(height: size.height * .025),
          ],
        ),
      ),
    );
  }
}
