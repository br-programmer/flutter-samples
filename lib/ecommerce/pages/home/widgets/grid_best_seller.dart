import 'package:flutter/material.dart';
import 'package:flutter_samples/ecommerce/models/phone.dart';
import 'package:flutter_samples/ecommerce/pages/detail/detail.dart';
import 'package:flutter_samples/ecommerce/utils/constans.dart';

class GridBestSeller extends StatelessWidget {
  const GridBestSeller({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: kBottomNavigationBarHeight * 1.75),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
            (_, i) => ItemBestSeller(
                  phone: phones[i],
                ),
            childCount: phones.length),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .75,
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
      ),
    );
  }
}

class ItemBestSeller extends StatelessWidget {
  const ItemBestSeller({Key key, this.phone}) : super(key: key);
  final Phone phone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Detaild(phone: phone))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(.075), blurRadius: 15)]),
          child: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset(phone.photos.first, fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(phone.price,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(color: EcommerceColors.backgroundColor, fontWeight: FontWeight.bold)),
                              const SizedBox(width: 5),
                              Text(
                                phone.oldPrice,
                                style: Theme.of(context).textTheme.caption.copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2.5),
                          Text(
                            phone.name,
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(color: EcommerceColors.backgroundColor, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 7.5,
                right: 7.5,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 5)],
                  ),
                  child: Icon(
                    phone.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: EcommerceColors.orange,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
