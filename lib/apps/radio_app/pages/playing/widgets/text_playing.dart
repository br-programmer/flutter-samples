import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/radio_app/bloc/radio_bloc.dart';
import 'package:flutter_samples/apps/radio_app/models/station.dart';
import 'package:flutter_samples/apps/radio_app/utils/constans.dart';
import 'package:provider/provider.dart';

class TextPlaying extends StatelessWidget {
  const TextPlaying({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radioApp = Provider.of<RadioBLoC>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Row(
        children: [
          Spacer(),
          Text(
            'Playing now',
            style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          ValueListenableBuilder<Station>(
              valueListenable: radioApp.station,
              builder: (_, station, __) =>
                  Icon(station.isFavorite ? Icons.favorite : Icons.favorite_border, color: RadioAppColors.redPurple)),
        ],
      ),
    );
  }
}
