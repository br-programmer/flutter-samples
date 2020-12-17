import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/salud_financiera/models/chart.dart';
import 'package:flutter_samples/apps/salud_financiera/utils/constans.dart';
import 'package:intl/intl.dart';

class ListStadistic extends StatelessWidget {
  const ListStadistic({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate:
          SliverChildBuilderDelegate((_, i) => ItemStadistic(chart: charst[i].dataChart), childCount: charst.length),
    );
  }
}

class ItemStadistic extends StatelessWidget {
  const ItemStadistic({Key key, this.chart}) : super(key: key);
  final List<DataChart> chart;

  @override
  Widget build(BuildContext context) {
    final myStyle = Theme.of(context).textTheme.bodyText1.copyWith(
          color: Colors.black87,
          fontWeight: FontWeight.w400,
        );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 10)],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Todo', style: myStyle),
                    const SizedBox(width: 25),
                    Text('Este mes', style: myStyle.copyWith(color: SaludFinacieraColors.primary)),
                    const SizedBox(width: 25),
                    Text('Esta semana', style: myStyle),
                    Spacer(),
                    Icon(Icons.more_vert, color: SaludFinacieraColors.primary),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: BezierChart(
                    bezierChartScale: BezierChartScale.CUSTOM,
                    xAxisCustomValues: chart.map((e) => e.position).toList(),
                    series: [
                      BezierLine(
                        data:
                            chart.map<DataPoint>((e) => DataPoint<double>(value: e.value, xAxis: e.position)).toList(),
                        lineColor: SaludFinacieraColors.primary,
                        dataPointFillColor: SaludFinacieraColors.background,
                      ),
                    ],
                    config: BezierChartConfig(
                        footerHeight: 5,
                        showVerticalIndicator: false,
                        bubbleIndicatorValueFormat:
                            NumberFormat.currency(locale: 'en_US', decimalDigits: 2, symbol: '\$'),
                        bubbleIndicatorTitleStyle: TextStyle(),
                        updatePositionOnTap: true,
                        bubbleIndicatorValueStyle: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: SaludFinacieraColors.blue, fontWeight: FontWeight.w800)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
