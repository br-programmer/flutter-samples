import 'dart:ui';

import 'package:flutter/material.dart';

class ListInfoPlanet extends StatefulWidget {
  const ListInfoPlanet({Key key}) : super(key: key);

  @override
  _ListInfoPlanetState createState() => _ListInfoPlanetState();
}

class _ListInfoPlanetState extends State<ListInfoPlanet> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: .85);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: kBottomNavigationBarHeight * 1.8,
      child: Container(
        height: 180,
        width: MediaQuery.of(context).size.width,
        child: PageView.builder(
          controller: _pageController,
          itemCount: 3,
          itemBuilder: (_, __) => const ItemInfo(),
        ),
      ),
    );
  }
}

class ItemInfo extends StatelessWidget {
  const ItemInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Color(0xff4E6365).withOpacity(.6),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(flex: 2, child: Image.asset('assets/images/space_concept/earth-circle.png')),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Information',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Distance from the sun:',
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '149.6 millons km',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 1.5),
                        Text(
                          'Age:',
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '4.543 thousands of millions old year',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 1.5),
                        Text(
                          'Radio:',
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '6,371 km',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
