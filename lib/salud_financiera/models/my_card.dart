class MyCard {
  final double currentValue;
  final double meta;
  final double percent;

  MyCard({this.currentValue, this.meta, this.percent});
}

final myCards = <MyCard>[
  MyCard(currentValue: 120000, meta: 350000, percent: .35),
  MyCard(currentValue: 20000, meta: 10000, percent: .5),
  MyCard(currentValue: 1250, meta: 5000, percent: .25),
  MyCard(currentValue: 150000, meta: 100000, percent: .33),
];
