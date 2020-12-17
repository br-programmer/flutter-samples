import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/find_home/models/house.dart';
import 'package:flutter_samples/apps/find_home/pages/detail/detail.dart';
import 'package:flutter_samples/apps/find_home/utils/constans.dart';
import 'package:flutter_samples/apps/find_home/widgets/button_favorite.dart';
import 'package:flutter_samples/apps/find_home/widgets/facilities.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListHouse extends StatelessWidget {
  const ListHouse({Key key, this.isAccount = false}) : super(key: key);
  final bool isAccount;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(bottom: isAccount ? 0.0 : kBottomNavigationBarHeight * 1.5),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, i) => ItemHouse(house: houses[i], padding: isAccount ? 20.0 : 0.0),
          childCount: houses.length,
        ),
      ),
    );
  }
}

class ItemHouse extends StatelessWidget {
  const ItemHouse({Key key, @required this.house, @required this.padding}) : super(key: key);
  final House house;
  final double padding;

  void _goToDetail(BuildContext context) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => Detail(house: house)));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20, left: padding, right: padding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: () => _goToDetail(context),
          child: AspectRatio(
            aspectRatio: .95,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Hero(tag: '${house.photos.first} - first', child: Image.asset(house.photos.first, fit: BoxFit.cover)),
                _Location(location: house.user.location),
                _DetailHouse(house: house),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailHouse extends StatelessWidget {
  const _DetailHouse({Key key, @required this.house}) : super(key: key);

  final House house;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Hero(
        tag: house.name,
        child: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Positioned(right: 15, top: -42.5, child: ButtonFavorite()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(house.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: FindHomeColors.blueDark, fontWeight: FontWeight.w700)),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            CircleAvatar(radius: 14, backgroundImage: AssetImage(house.user.photo)),
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(house.user.name,
                                    style:
                                        Theme.of(context).textTheme.subtitle2.copyWith(color: FindHomeColors.blueDark)))
                          ]),
                          Text('\$${house.price.toStringAsFixed(0)} usd',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(color: FindHomeColors.blueDark, fontWeight: FontWeight.w700))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingAndReviews(rating: house.user.rating, reviews: house.reviews),
                          Facilities(house: house),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RatingAndReviews extends StatelessWidget {
  const RatingAndReviews({Key key, @required this.reviews, @required this.rating}) : super(key: key);

  final int reviews;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(
            5,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 5),
              child: SvgPicture.asset(
                'assets/images/find_home/star.svg',
                width: 15,
                color: (index < rating) ? FindHomeColors.cyan : Colors.black12,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            '$reviews opinions',
            style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.black26),
          ),
        ),
      ],
    );
  }
}

class _Location extends StatelessWidget {
  const _Location({Key key, @required this.location}) : super(key: key);

  final String location;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/images/find_home/location.svg', width: 15),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                location,
                style: Theme.of(context).textTheme.subtitle2.copyWith(color: FindHomeColors.blueDark),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
