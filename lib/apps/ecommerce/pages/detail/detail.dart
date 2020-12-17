import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/ecommerce/models/phone.dart';
import 'package:flutter_samples/apps/ecommerce/pages/detail/widgets/widgets.dart';
import 'package:flutter_samples/apps/ecommerce/utils/constans.dart';
import 'package:flutter_samples/apps/ecommerce/widgets/button_orange.dart';
import 'package:flutter_samples/apps/ecommerce/widgets/my_back_button.dart';

class Detaild extends StatelessWidget {
  const Detaild({Key key, @required this.phone}) : super(key: key);
  final Phone phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EcommerceColors.scaffold,
      body: SafeArea(child: Column(children: [_Header(), PhotosPhone(photos: phone.photos), _Body(phone: phone)])),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key key, @required this.phone}) : super(key: key);

  final Phone phone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 35, 25, 30),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
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
          Text('Select color and capacity',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: EcommerceColors.backgroundColor, fontWeight: FontWeight.w700)),
          ColorAndCapacity(phone: phone),
          AddCart(text: phone.price),
        ],
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
