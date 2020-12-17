import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/music_app/models/music.dart';
import 'package:flutter_samples/apps/music_app/utils/constans.dart';

class Select extends StatelessWidget {
  const Select({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 20),
        child: AspectRatio(
          aspectRatio: 16 / 7.5,
          child: Column(
            children: [const _HeaderSelect(), const _ListSelect()],
          ),
        ),
      ),
    );
  }
}

class _ListSelect extends StatelessWidget {
  const _ListSelect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (_, constrains) => ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 15),
          itemCount: newReleases.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, i) => ItemListNewReleases(music: newReleases[i], constrains: constrains),
        ),
      ),
    );
  }
}

class _HeaderSelect extends StatelessWidget {
  const _HeaderSelect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: MediaQuery.of(context).size.width * .15, bottom: 15),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: headerMusics.map((e) => _ItemHeader(index: headerMusics.indexOf(e), text: e)).toList()),
    );
  }
}

class ItemListNewReleases extends StatelessWidget {
  const ItemListNewReleases({Key key, @required this.music, @required this.constrains}) : super(key: key);

  final Music music;
  final BoxConstraints constrains;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constrains.maxHeight,
      width: constrains.maxHeight * .75,
      margin: EdgeInsets.only(right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(width: double.infinity, child: Image.asset(music.poster, fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              music.name,
              style: Theme.of(context).textTheme.subtitle2.copyWith(fontFamily: 'Avenir'),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Text(music.artist,
                style: Theme.of(context).textTheme.caption.copyWith(fontFamily: 'Avenir'),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}

class _ItemHeader extends StatefulWidget {
  const _ItemHeader({Key key, @required this.index, @required this.text}) : super(key: key);

  final int index;
  final String text;

  @override
  __ItemHeaderState createState() => __ItemHeaderState();
}

class __ItemHeaderState extends State<_ItemHeader> {
  final _containerKey = GlobalKey();
  ValueNotifier<double> _containerWidth = ValueNotifier<double>(0.0);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _containerWidth.value = _containerKey.currentContext.size.width;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _containerKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(this.widget.text,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: (widget.index == 0) ? Colors.white : Colors.white38,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Avenir')),
          ValueListenableBuilder(
            valueListenable: _containerWidth,
            builder: (_, value, __) {
              return Padding(
                padding: EdgeInsets.only(top: 2.5),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  color: MusicAppColors.bluePurple,
                  width: (widget.index == 0) ? _containerWidth.value * .45 : 0,
                  height: 2.5,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
