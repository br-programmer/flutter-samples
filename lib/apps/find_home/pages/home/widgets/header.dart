import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/find_home/pages/account/account.dart';
import 'package:flutter_samples/apps/find_home/utils/constans.dart';
import 'package:flutter_samples/apps/find_home/widgets/imagen_account.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 16 / 6.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [const _UserData(), AspectRatio(aspectRatio: 16 / 1.5), const _UserNameStartLoking()],
        ),
      ),
    );
  }
}

class _UserData extends StatelessWidget {
  const _UserData({Key key}) : super(key: key);

  void _goToAccount(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (_) => Account()));

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ImagenAccount(),
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                  child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SvgPicture.asset('assets/images/find_home/location.svg', width: 20)),
                  alignment: PlaceholderAlignment.middle),
              TextSpan(
                  text: 'Santa Ana, EC',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: FindHomeColors.blueDark, fontWeight: FontWeight.w600)),
              WidgetSpan(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: RotatedBox(
                          quarterTurns: 1,
                          child: Icon(Icons.arrow_forward_ios, color: FindHomeColors.blueDark, size: 20))),
                  alignment: PlaceholderAlignment.middle),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Stack(overflow: Overflow.visible, children: [
                      SvgPicture.asset('assets/images/find_home/bell.svg', width: 25),
                      Positioned(right: 0, top: -5, child: CircleAvatar(radius: 7.5, backgroundColor: Colors.red))
                    ]),
                  ),
                  alignment: PlaceholderAlignment.middle),
              WidgetSpan(
                  child: GestureDetector(
                    onTap: () => _goToAccount(context),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: SvgPicture.asset('assets/images/find_home/setting.svg', width: 25)),
                  ),
                  alignment: PlaceholderAlignment.middle),
            ],
          ),
        ),
      ],
    );
  }
}

class _UserNameStartLoking extends StatelessWidget {
  const _UserNameStartLoking({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Hello Brayan!',
            style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black38, fontWeight: FontWeight.w200)),
        Text(
          'Start looking for your house',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: FindHomeColors.blueDark, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
