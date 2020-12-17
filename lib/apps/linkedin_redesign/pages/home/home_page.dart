import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/linkedin_redesign/bloc/home_bloc.dart';
import 'package:flutter_samples/apps/linkedin_redesign/pages/home/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(children: [const _Body(), const NavBar()]),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeBLoC>(context, listen: false);
    return Positioned.fill(
      child: CustomScrollView(
        controller: provider.controller,
        slivers: [const Header(), const NewPost(), const ListPost()],
      ),
    );
  }
}
