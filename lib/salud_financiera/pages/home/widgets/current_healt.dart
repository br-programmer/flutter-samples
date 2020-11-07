import 'package:flutter/material.dart';
import 'package:flutter_samples/salud_financiera/bloc/health_bloc.dart';
import 'package:flutter_samples/salud_financiera/models/my_card.dart';
import 'package:flutter_samples/salud_financiera/pages/home/widgets/cards.dart';
import 'package:flutter_samples/salud_financiera/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CurrentHealth extends StatelessWidget {
  const CurrentHealth({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: AspectRatio(
          aspectRatio: 16 / 11,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [const _HeaderCurrentHealth(), const Cards(), const _Indicators()],
          ),
        ),
      ),
    );
  }
}

class _Indicators extends StatelessWidget {
  const _Indicators({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final healthBloc = Provider.of<HealthBLoC>(context, listen: false);
    return AnimatedBuilder(
      animation: healthBloc.pageController,
      builder: (_, __) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(myCards.length, (index) {
          bool isSelected = index == 0;
          if (healthBloc.pageController.hasClients && healthBloc.pageController.page != null) {
            isSelected = healthBloc.pageController.page.toInt() == index;
          }
          return AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            margin: EdgeInsets.all(2.5),
            width: isSelected ? 20 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: isSelected ? SaludFinacieraColors.primary : Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
          );
        }),
      ),
    );
  }
}

class _HeaderCurrentHealth extends StatelessWidget {
  const _HeaderCurrentHealth({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Tu salud actual',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: SaludFinacieraColors.blue, fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 10)]),
            child: SvgPicture.asset('assets/images/salud/add.svg', height: 20),
          ),
        ],
      ),
    );
  }
}
