import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/salud_financiera/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCustomAppBar extends StatelessWidget {
  const MyCustomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kToolbarHeight * 2.5,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(offset: Offset(0, 5), color: Colors.black.withOpacity(.05), blurRadius: 10)],
      ),
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Hola, ',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: SaludFinacieraColors.blue, fontWeight: FontWeight.w800),
                      children: [
                        TextSpan(
                            text: 'Brayan',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontWeight: FontWeight.w400, color: SaludFinacieraColors.blue))
                      ]),
                ),
                Text(
                  'Tenemos excelentes noticias para ti',
                  style: TextStyle(color: SaludFinacieraColors.blue, fontWeight: FontWeight.w400, fontSize: 10),
                ),
              ],
            ),
          ),
          Container(
            height: 25,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Stack(
              alignment: Alignment.center,
              overflow: Overflow.visible,
              children: [
                SvgPicture.asset('assets/images/salud/bell.svg', height: 22),
                Positioned(
                  right: -1.25,
                  bottom: 7.5,
                  child: CircleAvatar(radius: 4, backgroundColor: Colors.red),
                )
              ],
            ),
          ),
          CircleAvatar(
            radius: 12,
            backgroundColor: SaludFinacieraColors.primary,
            child: CircleAvatar(
              radius: 10.5,
              backgroundImage: AssetImage('assets/images/brayan.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
