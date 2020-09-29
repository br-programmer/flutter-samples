import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/space_concept/pages/home/widgets/widgets.dart';

class SpaceHome extends StatelessWidget {
  final isHome = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return ValueListenableBuilder(
      valueListenable: isHome,
      builder: (_, value, __) => Stack(
        children: [
          Positioned(
            top: -10,
            bottom: -10,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: value
                  ? Image.asset('assets/images/space_concept/01.jpg', fit: BoxFit.cover, key: Key('home'))
                  : Image.asset('assets/images/space_concept/02.jpg', fit: BoxFit.cover, key: Key('detail')),
            ),
          ),
          Positioned.fill(
              bottom: kBottomNavigationBarHeight,
              child: DecoratedBox(decoration: BoxDecoration(color: Colors.black38))),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CustomAppBar(),
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: value
                              ? Column(
                                  key: Key('Home'),
                                  children: [
                                    const Search(),
                                    NamePlanets(),
                                    const ImagenPlanet(),
                                    DetailPlanet(onTap: () => isHome.value = !value)
                                  ],
                                )
                              : Column(
                                  key: Key('Explored'),
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Back(onTap: () => isHome.value = !value),
                                    const Explore(),
                                    const ImagenPlanetExplore()
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
                  MyBottomNavigationBar(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
