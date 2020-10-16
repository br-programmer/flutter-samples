import 'package:flutter/material.dart';
import 'package:flutter_samples/find_home/utils/constans.dart';
import 'package:flutter_samples/find_home/widgets/imagen_account.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DataUser extends StatelessWidget {
  const DataUser({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 7,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios, size: 30, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Brayan Cantos',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: FindHomeColors.blueDark, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Row(
                            children: List.generate(
                              5,
                              (index) => Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: SvgPicture.asset(
                                  'assets/images/find_home/star.svg',
                                  width: 20,
                                  color: (index < 4) ? FindHomeColors.cyan : Colors.black12,
                                ),
                              ),
                            ),
                          ),
                          Text('(10)',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(color: Colors.black12, fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                              child: Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: SvgPicture.asset('assets/images/find_home/location.svg', width: 15)),
                              alignment: PlaceholderAlignment.middle),
                          TextSpan(
                              text: 'Santa Ana, EC',
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(color: FindHomeColors.blueDark, fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ],
                ),
                ImagenAccount(radius: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
