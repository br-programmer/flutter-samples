import 'package:flutter/material.dart';
import 'package:flutter_samples/salud_financiera/bloc/health_bloc.dart';
import 'package:flutter_samples/salud_financiera/models/my_card.dart';
import 'package:flutter_samples/salud_financiera/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class Cards extends StatelessWidget {
  const Cards({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final healthBloc = Provider.of<HealthBLoC>(context, listen: false);
    return Expanded(
      child: PageView.builder(
        controller: healthBloc.pageController,
        itemCount: myCards.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, i) => _Card(card: myCards[i]),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({Key key, this.card}) : super(key: key);
  final MyCard card;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 7.5),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              spreadRadius: 2.5,
              color: SaludFinacieraColors.primary.withOpacity(.1),
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Ver detalles',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(fontWeight: FontWeight.w400, color: SaludFinacieraColors.blue),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: CircularPercentIndicator(
                radius: 100,
                progressColor: SaludFinacieraColors.primary,
                percent: card.percent,
                startAngle: 330,
                lineWidth: 8,
                animation: true,
                center: Text(
                  '${(card.percent * 100).toInt()}%',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: SaludFinacieraColors.primary,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    'assets/images/salud/visa.svg',
                    color: SaludFinacieraColors.blue,
                    width: 50,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Brayan Cantos',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: SaludFinacieraColors.blue, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    NumberFormat.currency(decimalDigits: 2, locale: 'en_US', symbol: '\$').format(card.currentValue),
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: SaludFinacieraColors.primary, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Meta ${NumberFormat.currency(decimalDigits: 2, locale: 'en_US', symbol: '\$').format(card.meta)}',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: SaludFinacieraColors.red, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
