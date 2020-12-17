import 'package:flutter/cupertino.dart';
import 'package:flutter_samples/apps/instagram_redesign/utils/constant.dart';

class SearchCategory {
  final String path;
  final String name;
  final Color color;
  final bool isGradient;

  SearchCategory({@required this.path, @required this.name, this.color, this.isGradient = false});
}

final searchCategories = <SearchCategory>[
  SearchCategory(path: 'assets/images/instagram_redesign/tv.svg', name: 'IGTV', isGradient: true),
  SearchCategory(path: 'assets/images/instagram_redesign/bag.svg', name: 'TIENDA', color: InstagramColors.blue),
  SearchCategory(path: 'assets/images/instagram_redesign/plane.svg', name: 'VIAJES', color: InstagramColors.purple),
  SearchCategory(path: 'assets/images/instagram_redesign/fitness.svg', name: 'FITNESS', color: InstagramColors.pink),
];
