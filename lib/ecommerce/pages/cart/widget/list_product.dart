import 'package:flutter/material.dart';
import 'package:flutter_samples/ecommerce/models/phone.dart';
import 'package:flutter_samples/ecommerce/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 50, left: 25, right: 25),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          itemCount: cart.length,
          itemBuilder: (_, i) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      width: 90,
                      height: 90,
                      child: Image.asset(cart[i].phone.photos.first, fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            cart[i].phone.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            cart[i].phone.price,
                            style: Theme.of(context).textTheme.headline6.copyWith(color: EcommerceColors.orange),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Color(0xFF41415A), borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.symmetric(vertical: 7.5, horizontal: 5),
                    margin: EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Icon(Icons.remove, color: Colors.white, size: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            cart[i].count.toString(),
                            style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
                          ),
                        ),
                        Icon(Icons.add, color: Colors.white, size: 15),
                      ],
                    ),
                  ),
                  SvgPicture.asset('assets/images/ecommerce/trash.svg', height: 25)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
