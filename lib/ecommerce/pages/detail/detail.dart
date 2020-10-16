import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/ecommerce/models/phone.dart';
import 'package:flutter_samples/ecommerce/utils/constans.dart';
import 'package:flutter_samples/ecommerce/widgets/button_orange.dart';
import 'package:flutter_samples/ecommerce/widgets/my_back_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Detaild extends StatelessWidget {
  const Detaild({Key key, @required this.phone}) : super(key: key);
  final Phone phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EcommerceColors.scaffold,
      body: SafeArea(
        child: Column(
          children: [
            _Header(),
            PhotosPhone(photos: phone.photos),
            Container(
              padding: const EdgeInsets.fromLTRB(25, 35, 25, 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Name(name: phone.name),
                  Rating(rating: phone.rating),
                  const InfoSelect(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemCapacities(path: 'assets/images/ecommerce/process.svg', text: phone.processor),
                        ItemCapacities(path: 'assets/images/ecommerce/camera.svg', text: phone.cameras),
                        ItemCapacities(path: 'assets/images/ecommerce/ram.svg', text: phone.memoryRam),
                        ItemCapacities(path: 'assets/images/ecommerce/sand.svg', text: '${phone.capacities.first} GB'),
                      ],
                    ),
                  ),
                  Text(
                    'Select color and capacity',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: EcommerceColors.backgroundColor, fontWeight: FontWeight.w700),
                  ),
                  ColorAndCapaciity(phone: phone),
                  AddCart(text: phone.price),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

class ItemCapacities extends StatelessWidget {
  const ItemCapacities({Key key, @required this.path, @required this.text}) : super(key: key);

  final String path;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(path, height: 25),
        const SizedBox(height: 3.5),
        Text(text, style: Theme.of(context).textTheme.caption),
      ],
    );
  }
}

class Rating extends StatelessWidget {
  const Rating({Key key, @required this.rating}) : super(key: key);

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          5, (index) => Icon((index < rating) ? Icons.star : Icons.star_border, color: Color(0xFFFFB800))),
    );
  }
}

class Name extends StatelessWidget {
  const Name({Key key, @required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: EcommerceColors.backgroundColor, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: EcommerceColors.backgroundColor, borderRadius: BorderRadius.circular(7.5)),
          padding: const EdgeInsets.all(10),
          child:
              Center(child: SvgPicture.asset('assets/images/ecommerce/favorite.svg', color: Colors.white, height: 15)),
        )
      ],
    );
  }
}

class InfoSelect extends StatelessWidget {
  const InfoSelect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
          children: info
              .map(
                (e) => Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: (info.indexOf(e) == 0)
                            ? Border(bottom: BorderSide(color: EcommerceColors.orange, width: 2.5))
                            : Border()),
                    alignment: Alignment.center,
                    child: Text(
                      e,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: (info.indexOf(e) == 0) ? EcommerceColors.backgroundColor : Colors.black54,
                            fontWeight: (info.indexOf(e) == 0) ? FontWeight.bold : FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              )
              .toList()),
    );
  }
}

class ColorAndCapaciity extends StatelessWidget {
  const ColorAndCapaciity({Key key, @required this.phone}) : super(key: key);

  final Phone phone;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: phone.colors
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(top: 15, right: 15),
                    child: CircleAvatar(
                      backgroundColor: e,
                      radius: 22,
                      child:
                          (phone.colors.indexOf(e) == 0) ? Icon(Icons.check, color: Colors.white) : SizedBox.shrink(),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: Row(
            children: phone.capacities
                .map(
                  (e) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
                        decoration: BoxDecoration(
                          color: (phone.capacities.indexOf(e) == 0) ? EcommerceColors.orange : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text('$e GB',
                            style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: (phone.capacities.indexOf(e) == 0) ? Colors.white : Colors.black38,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class AddCart extends StatelessWidget {
  const AddCart({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      pressedOpacity: .75,
      onPressed: () {},
      padding: const EdgeInsets.only(top: 25),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: EcommerceColors.orange,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(15),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Add Cart',
              style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
            ),
            Text(
              '$text.00',
              style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 3,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 17.5, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyBackButton(),
            Text(
              'Product Details',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: EcommerceColors.backgroundColor, fontWeight: FontWeight.w600),
            ),
            ButtonOrange(path: 'assets/images/ecommerce/cart.svg'),
          ],
        ),
      ),
    );
  }
}
