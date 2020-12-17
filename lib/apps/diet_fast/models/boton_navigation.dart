import 'package:meta/meta.dart';

class ButtonNavigation {
  final String path;
  final String title;

  ButtonNavigation({@required this.path, @required this.title});
}

final itemsNavigation = <ButtonNavigation>[
  ButtonNavigation(path: 'assets/images/diet_fast/home.svg', title: 'Home'),
  ButtonNavigation(path: 'assets/images/diet_fast/user.svg', title: 'User'),
  ButtonNavigation(path: 'assets/images/diet_fast/tie.svg', title: 'Tie'),
  ButtonNavigation(path: 'assets/images/diet_fast/setting.svg', title: 'Setting'),
];
