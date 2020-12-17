import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/diet_fast/utils/constan.dart';
import 'package:flutter_samples/apps/diet_fast/widgets/round_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultsInformation extends StatefulWidget {
  const ResultsInformation({Key key}) : super(key: key);

  @override
  _ResultsInformationState createState() => _ResultsInformationState();
}

class _ResultsInformationState extends State<ResultsInformation> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: .85);
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 16 / 7,
        child: PageView.builder(
          controller: _pageController,
          physics: BouncingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (_, index) => Padding(
            padding: EdgeInsets.only(right: (index == 3) ? 0 : 10, top: 5, bottom: 20, left: (index == 0) ? 0 : 10),
            child: ItemResultInformation(),
          ),
        ),
      ),
    );
  }
}

class ItemResultInformation extends StatelessWidget {
  const ItemResultInformation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: -5)],
      ),
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          Positioned(left: 0, bottom: -10, child: RoundButton()),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Results of the week',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Results(text1: 'you have lost', text2: '-4kg'),
                        Results(text1: 'you level up', text2: 'Level 8'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Never give up,',
                        style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black),
                        children: [
                          TextSpan(
                              text: ' know more',
                              style: Theme.of(context).textTheme.caption.copyWith(color: DietFastColors.primary)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CircularPercentIndicator(
                radius: 90,
                percent: .5,
                lineWidth: 7.5,
                startAngle: 340,
                progressColor: DietFastColors.primary,
                backgroundColor: Color(0xffDCEBF5),
                animation: true,
                center: Text(
                  '520\nKcal',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Results extends StatelessWidget {
  const Results({Key key, @required this.text1, @required this.text2}) : super(key: key);

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black),
          ),
          Text(
            text2,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: DietFastColors.primary, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
