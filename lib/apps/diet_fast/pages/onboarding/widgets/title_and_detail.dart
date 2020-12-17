import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/diet_fast/models/slider.dart';
import 'package:provider/provider.dart';

class TittleAndDetail extends StatelessWidget {
  const TittleAndDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SliderIndex>(
      builder: (_, slider, __) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: Text(
                sliders[slider.index].title,
                key: Key(sliders[slider.index].title),
                style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: Text(
                sliders[slider.index].detail,
                key: Key(sliders[slider.index].detail),
                style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black54),
                textAlign: TextAlign.justify,
                maxLines: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
