import 'package:flutter/material.dart';
import 'package:flutter_samples/custom_painter/page_indicator_painter.dart';
import 'package:flutter_samples/find_home/utils/constans.dart';
import 'package:flutter_samples/find_home/widgets/button_favorite.dart';

class PhotosHouse extends StatefulWidget {
  const PhotosHouse({Key key, @required this.photos, @required this.aviable}) : super(key: key);

  final List<String> photos;
  final bool aviable;

  @override
  _PhotosHouseState createState() => _PhotosHouseState();
}

class _PhotosHouseState extends State<PhotosHouse> {
  PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: 0,
      bottom: size.height * .5,
      child: Container(
        width: size.width,
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: widget.photos.length,
              itemBuilder: (_, i) =>
                  Hero(tag: '${widget.photos.first} - first', child: Image.asset(widget.photos[i], fit: BoxFit.cover)),
            ),
            Positioned(
              top: size.height * .05,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonFavorite(
                          onTap: () => Navigator.pop(context),
                          size: 50,
                          child: Icon(Icons.arrow_back_ios, size: 30, color: FindHomeColors.blueDark)),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 7.5, horizontal: 40),
                        decoration: BoxDecoration(
                            color: widget.aviable ? Color(0xFF6CC775) : Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(widget.aviable ? 'Aviable' : 'Unavailable',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.white, fontWeight: FontWeight.w500)),
                      ),
                      ButtonFavorite(size: 50),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: size.height * .1,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (_, i) => CustomPaint(
                  painter: PageIndicatorPainter(
                    pageCount: widget.photos.length,
                    dotFillColor: Colors.white,
                    indicatorColor: FindHomeColors.cyan,
                    dotRadius: 5,
                    scrollPosition: (_controller.hasClients && _controller.page != null) ? _controller.page : 0.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
