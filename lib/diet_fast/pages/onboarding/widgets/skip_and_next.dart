import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/diet_fast/models/slider.dart';
import 'package:flutter_samples/diet_fast/pages/login/login.dart';
import 'package:flutter_samples/diet_fast/utils/constan.dart';
import 'package:provider/provider.dart';

class SkipAndNext extends StatelessWidget {
  const SkipAndNext({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Consumer<SliderIndex>(
        builder: (_, slider, __) {
          int page = slider.index;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CupertinoButton(
                onPressed: () {
                  if (page == 0) {
                    slider.index = sliders.length - 1;
                  } else {
                    slider.index = page - 1;
                  }
                },
                padding: EdgeInsets.zero,
                child: Text(
                  (page == 0) ? 'Skip step' : 'Back',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(color: Colors.black54, fontWeight: FontWeight.w500),
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  if (page < sliders.length - 1) {
                    slider.index = slider.index + 1;
                  } else {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Login()));
                  }
                },
                padding: EdgeInsets.zero,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  decoration: BoxDecoration(
                    color: DietFastColors.primary,
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                  child: Text(
                    (page < sliders.length - 1) ? 'Next' : 'Done',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
