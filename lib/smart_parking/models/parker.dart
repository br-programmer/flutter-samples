class Parker {
  final bool isFull;
  final String text;
  final bool isSelected;

  Parker({this.isFull = false, this.text = '', this.isSelected = false});
}

final parkerA5 = [
  Parker(isFull: true),
  Parker(text: 'A 02'),
  Parker(text: 'A 03'),
  Parker(isSelected: true, text: 'Selected'),
  Parker(isFull: true),
  Parker(isFull: true),
];
final parkerA6 = [
  Parker(text: 'A 07'),
  Parker(text: 'A 08'),
  Parker(text: 'A 09'),
  Parker(text: 'A 09'),
  Parker(isFull: true),
  Parker(isFull: true),
];
