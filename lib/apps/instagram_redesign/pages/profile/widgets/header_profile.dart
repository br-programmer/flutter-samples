import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/instagram_redesign/utils/constant.dart';
import 'package:flutter_samples/apps/instagram_redesign/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/instagram_redesign/add.svg',
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                  UserAvatar(image: 'assets/images/brayan.jpg', radius: MediaQuery.of(context).size.width * .12),
                  SvgPicture.asset(
                    'assets/images/instagram_redesign/chat.svg',
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Text('Brayan Cantos', style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(
              info,
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: hastags
                  .map(
                    (hastag) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Text(hastag,
                          style: Theme.of(context).textTheme.caption.copyWith(color: InstagramColors.blue)),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _MyPostFollowersFolowwing(count: 27, text: 'Post'),
                _MyPostFollowersFolowwing(count: 207, text: 'Seguidores'),
                _MyPostFollowersFolowwing(count: 1005, text: 'Seguidos'),
              ],
            ),
            const SizedBox(height: 15),
            const _ButtonFollow(),
          ],
        ),
      ),
    );
  }
}

class _ButtonFollow extends StatelessWidget {
  const _ButtonFollow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(colors: [InstagramColors.pink, InstagramColors.pink, InstagramColors.purple]),
        ),
        child: Text(
          'Seguir',
          style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}

class _MyPostFollowersFolowwing extends StatelessWidget {
  const _MyPostFollowersFolowwing({Key key, @required this.count, @required this.text}) : super(key: key);
  final int count;
  final String text;

  @override
  Widget build(BuildContext context) {
    String count = this.count.toString();
    if (count.length > 3) count = '${count.substring(0, 1)},${count.substring(1, count.length)}';
    return Column(
      children: [
        Text(
          count,
          style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(text, style: Theme.of(context).textTheme.caption),
      ],
    );
  }
}
