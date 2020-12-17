import 'package:meta/meta.dart' show required;

class SelectHouseMenu {
  final String name;
  final String path;
  SelectHouseMenu({@required this.name, @required this.path});
}

final selectHouseMenuItems = [
  SelectHouseMenu(name: 'Information', path: 'assets/images/find_home/info.svg'),
  SelectHouseMenu(name: 'Comments', path: 'assets/images/find_home/comments.svg'),
  SelectHouseMenu(name: 'Offers', path: 'assets/images/find_home/menu-4.svg'),
  SelectHouseMenu(name: 'Shared', path: 'assets/images/find_home/shared.svg')
];
