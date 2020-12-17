import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/salud_financiera/bloc/onboarding_bloc.dart';
import 'package:flutter_samples/apps/salud_financiera/models/onboarding.dart';
import 'package:flutter_samples/apps/salud_financiera/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PageOnboarding extends StatelessWidget {
  const PageOnboarding({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onBoardingBloc = Provider.of<OnBoardingBLoC>(context, listen: false);
    return Expanded(
      flex: 5,
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: itemsOnBoarding.length,
        controller: onBoardingBloc.pageController,
        itemBuilder: (_, i) => _ItemPageOnboarding(item: itemsOnBoarding[i]),
      ),
    );
  }
}

class _ItemPageOnboarding extends StatelessWidget {
  const _ItemPageOnboarding({Key key, @required this.item}) : super(key: key);

  final OnBoarding item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: SvgPicture.asset(item.path, height: 250),
        )),
        Text(item.title, style: TextStyle(color: SaludFinacieraColors.blue, fontWeight: FontWeight.w800, fontSize: 28)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Text(
            item.subtitle,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: SaludFinacieraColors.blue, fontWeight: FontWeight.w400),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
