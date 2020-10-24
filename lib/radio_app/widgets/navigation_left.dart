import 'package:flutter/material.dart';
import 'package:flutter_samples/radio_app/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationLeft extends StatelessWidget {
  NavigationLeft({Key key}) : super(key: key);

  final _index = ValueNotifier<int>(2);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Color(0xFF080833)),
      child: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.5, vertical: 25),
                child: SvgPicture.asset('assets/images/radio_app/radio-app-logo.svg', width: 35),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                stationsSelect.length,
                (i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: GestureDetector(
                    onTap: () => _index.value = i,
                    child: Column(
                      children: [
                        RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            stationsSelect[i],
                            style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ValueListenableBuilder(
                          valueListenable: _index,
                          builder: (_, value, __) => CircleAvatar(
                            radius: 7.5,
                            backgroundColor: (i == value) ? RadioAppColors.blueLight : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
