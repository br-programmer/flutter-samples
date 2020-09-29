import 'package:meta/meta.dart';

class OnBoarding {
  final String path;
  final String title;
  final String info;

  OnBoarding({@required this.path, @required this.title, @required this.info});
}

final itemsOnBoarding = <OnBoarding>[
  OnBoarding(
      path: 'assets/images/space_concept/space-1.svg',
      title: 'Explored Universe',
      info:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Habitant sem ut sit fames in adipiscing. Ac magna donec egestas habitant.'),
  OnBoarding(
      path: 'assets/images/space_concept/space-1.svg',
      title: 'Explored Universe',
      info:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Habitant sem ut sit fames in adipiscing. Ac magna donec egestas habitant.'),
  OnBoarding(
      path: 'assets/images/space_concept/space-1.svg',
      title: 'Explored Universe',
      info:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Habitant sem ut sit fames in adipiscing. Ac magna donec egestas habitant.'),
];
