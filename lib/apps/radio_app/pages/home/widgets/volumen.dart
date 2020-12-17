import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_samples/apps/radio_app/utils/constans.dart';

class Volumen extends StatelessWidget {
  Volumen({Key key}) : super(key: key);
  final _volume = ValueNotifier<double>(0.65);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
      child: ValueListenableBuilder(
          valueListenable: _volume,
          builder: (context, value, snapshot) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(FontAwesome.volume_up, color: Colors.grey),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30, left: 40),
                    child: SliderTheme(
                      data: Theme.of(context).sliderTheme.copyWith(
                          trackHeight: 3.5,
                          trackShape: RectangularSliderTrackShape(disabledThumbGapWidth: 2),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 0)),
                      child: Slider(
                        inactiveColor: Colors.grey.withOpacity(.4),
                        activeColor: RadioAppColors.blueLight,
                        value: value,
                        onChanged: (v) => _volume.value = v,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${(value * 100).toInt()}%',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
