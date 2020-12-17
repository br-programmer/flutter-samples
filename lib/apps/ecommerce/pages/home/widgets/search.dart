import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/ecommerce/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatelessWidget {
  const Search({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: AspectRatio(
          aspectRatio: 16 / 2.25,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 5)]),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/ecommerce/search.svg'),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CupertinoTextField(
                          decoration: BoxDecoration(),
                          placeholder: 'Search',
                          placeholderStyle: Theme.of(context).textTheme.caption,
                          style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15),
              CircleAvatar(
                backgroundColor: EcommerceColors.orange,
                child: SvgPicture.asset('assets/images/ecommerce/code.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
