import 'package:flutter/material.dart';
import 'package:flutter_samples/music_app/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 7,
      child: Container(
        decoration: BoxDecoration(
            color: MusicAppColors.secondary, borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/images/music_app/menu.svg', height: 15, color: Colors.white70),
                  SvgPicture.asset('assets/images/music_app/bell.svg', height: 25, color: Colors.white70),
                ],
              ),
              const _PostersArtistHeader(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PostersArtistHeader extends StatelessWidget {
  const _PostersArtistHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (_, constrains) {
          final size = constrains.maxWidth * .16;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              posters.length + 1,
              (i) => Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: (i > posters.length - 1) ? Colors.white70 : MusicAppColors.bluePurple, width: 1.5),
                    shape: BoxShape.circle),
                padding: EdgeInsets.all(1),
                child: (i > posters.length - 1)
                    ? Icon(Icons.add, color: Colors.white70)
                    : CircleAvatar(backgroundImage: AssetImage(posters[i])),
              ),
            ),
          );
        },
      ),
    );
  }
}
