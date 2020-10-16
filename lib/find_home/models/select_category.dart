import 'package:meta/meta.dart' show required;

class Category {
  final String name;
  final String path;

  Category({@required this.name, @required this.path});
}

final categories = <Category>[
  Category(name: 'Home', path: 'assets/images/find_home/house-menu.svg'),
  Category(name: 'Condominum', path: 'assets/images/find_home/condominium.svg'),
  Category(name: 'Keys', path: 'assets/images/find_home/keys.svg'),
  Category(name: 'Offers', path: 'assets/images/find_home/menu-4.svg'),
];
