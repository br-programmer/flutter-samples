import 'package:meta/meta.dart' show required;

class Category {
  final String name;
  final String path;

  Category({@required this.name, @required this.path});
}

final categories = <Category>[
  Category(name: 'Phones', path: 'assets/images/ecommerce/phone.svg'),
  Category(name: 'Computer', path: 'assets/images/ecommerce/computer.svg'),
  Category(name: 'Health', path: 'assets/images/ecommerce/health.svg'),
  Category(name: 'Books', path: 'assets/images/ecommerce/books.svg'),
  Category(name: 'Phones', path: 'assets/images/ecommerce/phone.svg'),
];
