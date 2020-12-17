import 'dart:ui';

import 'package:flutter/material.dart';

class PhotosPhone extends StatefulWidget {
  const PhotosPhone({Key key, @required this.photos}) : super(key: key);
  final List<String> photos;

  @override
  _PhotosPhoneState createState() => _PhotosPhoneState();
}

class _PhotosPhoneState extends State<PhotosPhone> {
  PageController _controller;

  final ValueNotifier<double> _page = ValueNotifier(1.0);

  void _listener() {
    _page.value = _controller.page;
    setState(() {});
  }

  @override
  void initState() {
    _controller = PageController(initialPage: 1, viewportFraction: .7);
    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.addListener(_listener));
    super.initState();
  }

  @override
  void dispose() {
    _controller?.removeListener(_listener);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: LayoutBuilder(builder: (_, constraints) {
          return PageView.builder(
            controller: _controller,
            itemCount: widget.photos.length,
            itemBuilder: (_, i) {
              final paddingHorizontal = constraints.maxWidth * .04;
              final paddingTop = lerpDouble(0, 1, (i - _page.value).abs());
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: paddingHorizontal, vertical: constraints.maxHeight * (.075 * paddingTop)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 12),
                      ],
                    ),
                    child: Image.asset(widget.photos[i], fit: BoxFit.cover),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
