import 'package:flutter/material.dart';

class SliverAppBarAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const MyAppBar(),
          const MyList(),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      expandedHeight: MediaQuery.of(context).size.height * .4,
      actions: [IconButton(icon: Icon(Icons.share), onPressed: () {})],
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset('assets/images/supercines/avenger-poster.png', fit: BoxFit.cover),
      ),
    );
  }
}

class MyList extends StatelessWidget {
  const MyList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, i) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            height: 100,
            color: Colors.primaries[i % Colors.primaries.length],
          ),
        ),
      ),
    );
  }
}
