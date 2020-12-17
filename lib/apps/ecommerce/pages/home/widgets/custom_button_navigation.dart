import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/ecommerce/pages/cart/cart.dart';
import 'package:flutter_samples/apps/ecommerce/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtonNavigation extends StatelessWidget {
  const CustomButtonNavigation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: kBottomNavigationBarHeight * 1.25,
        decoration: BoxDecoration(
            color: EcommerceColors.backgroundColor, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundColor: Colors.white, radius: 5),
                const SizedBox(width: 10),
                Text(
                  'Explorer',
                  maxLines: 1,
                  style:
                      Theme.of(context).textTheme.headline6.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => showCupertinoModalPopup(context: context, builder: (context) => Cart()),
              child: SvgPicture.asset('assets/images/ecommerce/cart.svg'),
            ),
            SvgPicture.asset('assets/images/ecommerce/favorite.svg'),
            SvgPicture.asset('assets/images/ecommerce/user.svg'),
          ],
        ),
      ),
    );
  }
}
