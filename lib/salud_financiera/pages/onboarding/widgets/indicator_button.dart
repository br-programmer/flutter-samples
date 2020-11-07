import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/custom_painter/page_indicator_painter.dart';
import 'package:flutter_samples/salud_financiera/bloc/onboarding_bloc.dart';
import 'package:flutter_samples/salud_financiera/models/onboarding.dart';
import 'package:flutter_samples/salud_financiera/pages/home/home.dart';
import 'package:flutter_samples/salud_financiera/utils/constans.dart';
import 'package:provider/provider.dart';

class IndicatorsAndButton extends StatelessWidget {
  const IndicatorsAndButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onBoardingBloc = Provider.of<OnBoardingBLoC>(context, listen: false);
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedBuilder(
              animation: onBoardingBloc.pageController,
              builder: (_, __) => CustomPaint(
                painter: PageIndicatorPainter(
                  pageCount: itemsOnBoarding.length,
                  dotRadius: 5,
                  indicatorColor: SaludFinacieraColors.primary,
                  dotFillColor: Colors.black12,
                  scrollPosition:
                      (onBoardingBloc.pageController.hasClients && onBoardingBloc.pageController.page != null)
                          ? onBoardingBloc.pageController.page
                          : 0.0,
                ),
              ),
            ),
            const _ButonStart(),
          ],
        ),
      ),
    );
  }
}

class _ButonStart extends StatelessWidget {
  const _ButonStart({Key key}) : super(key: key);

  void _goToHome(BuildContext context) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Home()));

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => _goToHome(context),
      pressedOpacity: .8,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 12, bottom: 12, left: 50, right: 15),
        decoration: BoxDecoration(color: SaludFinacieraColors.primary, borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Comenzar',
                style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.black.withOpacity(.1), borderRadius: BorderRadius.circular(5)),
              child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15),
            ),
          ],
        ),
      ),
    );
  }
}
