import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/ecommerce/pages/home/widgets/filter.dart';
import 'package:flutter_samples/ecommerce/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/ecommerce/location.svg'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Santa Ana, EC',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: EcommerceColors.backgroundColor, fontWeight: FontWeight.w600),
                  ),
                ),
                SvgPicture.asset('assets/images/ecommerce/arrow.svg', width: 15),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => showCupertinoModalPopup(context: context, builder: (context) => Filter()),
            child: SvgPicture.asset('assets/images/ecommerce/filter.svg', width: 13),
          ),
        ],
      ),
    );
  }
}
