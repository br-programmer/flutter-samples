import 'package:flutter/material.dart';
import 'package:flutter_samples/salud_financiera/bloc/splash_bloc.dart';
import 'package:flutter_samples/salud_financiera/pages/onboarding/onboarding.dart';
import 'package:flutter_samples/salud_financiera/utils/constans.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final splashBloc = Provider.of<SplashBLoC>(context, listen: false);
    return ValueListenableBuilder<SplashStatus>(
      valueListenable: splashBloc.status,
      builder: (_, status, child) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 450),
        child: (status == SplashStatus.loaded) ? OnBoardingPage() : child,
      ),
      child: SplashBody(),
    );
  }
}

class SplashBody extends StatelessWidget {
  const SplashBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/salud/logo.svg'),
                const SizedBox(width: 10),
                Text(
                  'Salud\nfinanciera',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: SaludFinacieraColors.blue, fontWeight: FontWeight.w800, fontSize: 28),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Text(
                'EOS SOFTWARE',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: SaludFinacieraColors.blue, fontWeight: FontWeight.w800, wordSpacing: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
