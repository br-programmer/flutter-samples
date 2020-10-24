import 'package:flutter/material.dart';
import 'package:flutter_samples/radio_app/bloc/radio_bloc.dart';
import 'package:flutter_samples/radio_app/models/station.dart';
import 'package:provider/provider.dart';

class FrequencyName extends StatelessWidget {
  const FrequencyName({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radioApp = Provider.of<RadioBLoC>(context, listen: false);
    return Positioned(
      left: MediaQuery.of(context).size.width / 2.75,
      child: ValueListenableBuilder<Station>(
        valueListenable: radioApp.station,
        builder: (_, station, __) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              station.frequency.toString(),
              style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              'Radio ${station.name}',
              style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.w700, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
