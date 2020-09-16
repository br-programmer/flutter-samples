import 'package:flutter/material.dart';
import 'package:flutter_samples/instagram_redesign/models/search_category.dart';
import 'package:flutter_samples/instagram_redesign/utils/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchCategoryList extends StatelessWidget {
  const SearchCategoryList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: 10),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 120,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 20),
            itemCount: searchCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, i) => ItemSearchCategory(searchCategory: searchCategories[i]),
          ),
        ),
      ),
    );
  }
}

class ItemSearchCategory extends StatelessWidget {
  const ItemSearchCategory({Key key, this.searchCategory}) : super(key: key);
  final SearchCategory searchCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: MediaQuery.of(context).size.width * .25,
      decoration: BoxDecoration(
        color: (!searchCategory.isGradient) ? searchCategory.color : null,
        borderRadius: BorderRadius.circular(20),
        gradient: (searchCategory.isGradient)
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [InstagramColors.purple, InstagramColors.pink, InstagramColors.orange],
                stops: [.1, .7, 1],
              )
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(searchCategory.path, width: 40),
          const SizedBox(height: 10),
          Text(
            searchCategory.name,
            style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
