import 'package:flutter/material.dart';
import 'package:flutter_samples/radio_app/models/station.dart';

class RadioBLoC extends ChangeNotifier {
  final List<Station> listStations;

  ValueNotifier<Station> _station = ValueNotifier(stations[0]);
  RadioBLoC(this.listStations);

  ValueNotifier<Station> get station => this._station;

  set setStation(Station station) {
    this._station.value = station;
  }
}
