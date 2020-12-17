import 'package:flutter/material.dart' show Color, required;

class Station {
  final double frequency;
  final String name;
  final bool isFavorite;
  final Color color;

  Station({@required this.frequency, @required this.name, @required this.isFavorite, @required this.color});
}

final stations = <Station>[
  Station(frequency: 90.5, name: 'Divelement', isFavorite: true, color: Color(0xFFB02854)),
  Station(frequency: 94.3, name: 'Diegoveloper', isFavorite: true, color: Color(0xFF178ADD)),
  Station(frequency: 98.5, name: 'BrProgrammer', isFavorite: true, color: Color(0xFF8715CC)),
  Station(frequency: 91.0, name: 'Argel', isFavorite: false, color: Color(0xFF28B06F)),
  Station(frequency: 104.2, name: 'Miau Miau', isFavorite: true, color: Color(0xFFE81212)),
  Station(frequency: 92.7, name: 'Flutter', isFavorite: false, color: Color(0xFFE3A810)),
];
