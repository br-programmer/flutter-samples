import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/animation/loading.dart';
import 'package:flutter_samples/ecommerce/bloc/splash_bloc.dart';
import 'package:flutter_samples/ecommerce/pages/home/home.dart';
import 'package:flutter_samples/ecommerce/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    final splashBloc = Provider.of<SplashBLoC>(context);
    return ValueListenableBuilder(
      valueListenable: splashBloc.status,
      builder: (_, status, child) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 450),
          child: (status == SplashStatus.loaded) ? Home() : child,
        );
      },
      child: Scaffold(
        backgroundColor: EcommerceColors.backgroundColor,
        body: Center(
          child: SvgPicture.asset('assets/images/ecommerce/logo_ecommerce.svg',
              width: MediaQuery.of(context).size.width * .5),
        ),
        bottomNavigationBar: Container(
          height: kToolbarHeight,
          width: MediaQuery.of(context).size.width,
          child: Loading(color: EcommerceColors.orange),
        ),
      ),
    );
  }
}
