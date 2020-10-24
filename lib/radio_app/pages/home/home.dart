import 'package:flutter/material.dart';
import 'package:flutter_samples/radio_app/pages/home/widgets/widgets.dart';
import 'package:flutter_samples/radio_app/utils/constans.dart';
import 'package:flutter_samples/radio_app/widgets/navigation_left.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RadioAppColors.blueDark,
      body: Row(
        children: [
          NavigationLeft(),
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Header(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        'Popular',
                        style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white),
                      ),
                    ),
                    ListStation(),
                    const Controls(),
                    Volumen(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
