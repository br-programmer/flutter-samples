class Chart {
  final List<DataChart> dataChart;
  Chart({this.dataChart});
}

class DataChart {
  final double value;
  final double position;
  DataChart({this.value, this.position});
}

final charst = <Chart>[
  Chart(
    dataChart: [
      DataChart(value: 0, position: 0),
      DataChart(value: 2085, position: 1),
      DataChart(value: 720, position: 2),
      DataChart(value: 2538, position: 3),
      DataChart(value: 1254, position: 4),
      DataChart(value: 2735, position: 5),
      DataChart(value: 1035, position: 6),
      DataChart(value: 2935, position: 7)
    ],
  ),
  Chart(
    dataChart: [
      DataChart(value: 10, position: 0),
      DataChart(value: 550, position: 2),
      DataChart(value: 320, position: 4),
      DataChart(value: 820, position: 6),
    ],
  ),
  Chart(
    dataChart: [
      DataChart(value: 0, position: 0),
      DataChart(value: 200, position: 3),
      DataChart(value: 75, position: 6),
      DataChart(value: 520, position: 9),
      DataChart(value: 650, position: 10),
    ],
  ),
  Chart(
    dataChart: [
      DataChart(value: 0, position: 0),
      DataChart(value: 500, position: 1),
      DataChart(value: 262, position: 2),
      DataChart(value: 758, position: 3),
      DataChart(value: 623, position: 4),
      DataChart(value: 1252, position: 5),
    ],
  ),
];
