import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/instagram_redesign/pages/search/widgets/widgets.dart';
import 'package:flutter_samples/instagram_redesign/widgets/widgets.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            const MyCustomAppBar(isHome: false),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  const SearchCategoryList(),
                  const Search(),
                  const SliverToBoxAdapter(child: SizedBox(height: 25)),
                  const GridPopular(),
                  const SliverToBoxAdapter(child: SizedBox(height: 75)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
