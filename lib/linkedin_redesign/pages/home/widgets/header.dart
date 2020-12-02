import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/linkedin_redesign/models/user.dart';
import 'package:flutter_samples/linkedin_redesign/utils/linkedin_colors.dart';
import 'package:flutter_samples/widgets/sliver_header_delegate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      delegate: SliverCustomHeaderDelegate(
        minHeight: 80,
        maxHeight: 80,
        child: Container(
          color: LinkedInColors.background,
          child: Row(
            children: [const _PhotoUser(), const _Search(), const _NewMessage()],
          ),
        ),
      ),
    );
  }
}

class _Search extends StatelessWidget {
  const _Search({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        child: CupertinoTextField(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(color: LinkedInColors.white, borderRadius: BorderRadius.circular(7.5)),
          prefix: Padding(padding: const EdgeInsets.only(left: 10), child: Icon(Icons.search, color: Colors.black26)),
          placeholder: 'Search',
          placeholderStyle: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black26),
          style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black87),
        ),
      ),
    );
  }
}

class _NewMessage extends StatelessWidget {
  const _NewMessage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.5),
            color: LinkedInColors.white,
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 7.5)]),
        alignment: Alignment.center,
        child: SvgPicture.asset('assets/linkedin/icons/message.svg'),
      ),
    );
  }
}

class _PhotoUser extends StatelessWidget {
  const _PhotoUser({Key key}) : super(key: key);

  void _onTap(BuildContext context) {
    // Navigator.push(
    //   context,
    //   PageRouteBuilder(
    //       transitionDuration: const Duration(milliseconds: 600),
    //       pageBuilder: (_, animation, __) => FadeTransition(opacity: animation, child: ProfilePage())),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () => _onTap(context),
        child: Image.asset(user.photo, height: 40),
      ),
    );
  }
}
