import 'package:flutter/material.dart';
import 'package:flutter_samples/radio_app/pages/home/widgets/widgets.dart';
import 'package:flutter_samples/radio_app/pages/playing/widgets/widgets.dart';
import 'package:flutter_samples/radio_app/utils/constans.dart';
import 'package:flutter_samples/radio_app/widgets/navigation_left.dart';

class Playing extends StatelessWidget {
  const Playing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        children: [
          NavigationLeft(),
          Expanded(child: Stack(children: [const _Background(), const _Body()]))
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: DecoratedBox(
            decoration: BoxDecoration(
                color: RadioAppColors.blueDark,
                image: DecorationImage(image: AssetImage('assets/images/radio_app/1.png'), fit: BoxFit.cover))));
  }
}

class _Body extends StatelessWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: SafeArea(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), child: Header(isPlaying: true)),
            const TextPlaying(),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const Points(),
                      const FrequencyName(),
                      const TopMusic(),
                    ],
                  ),
                ),
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
